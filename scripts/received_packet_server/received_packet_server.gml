// our two arguments for server
buffer = argument0;
socket = argument1;

// need to declare function in script as of version 2.3
function received_packet_server(buffer,socket){
	
	// read data from previously created buffer of argument0
	msgid = buffer_read(buffer, buffer_u8);
	
	switch(msgid)
	{
		// read clients username from buffer into variable
		case NETWORK_SERVER.PLAYER_ESTABLISHED:
			var _username = buffer_read(buffer,buffer_string);
			
			network_player_join(_username);
			
			break;
			
		case NETWORK_SERVER.CHAT:
			var _chat = buffer_read(buffer,buffer_string);
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			_chat = _player.username+": "+_chat;
			
			// server to see chat
			ds_list_insert(global.chat,0,_chat);
			ds_list_insert(global.chat_color,0,c_white);
			
			// send chat to other players
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				// store iterated client into variable
				var _sock = ds_list_find_value(socket_list,_i)
				
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.CHAT);
				buffer_write(server_buffer,buffer_string,_chat);
				buffer_write(server_buffer,buffer_u8,1);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}			
			
			break;
			
		// if id from the server is SHOOT ->
		case NETWORK_SERVER.SHOOT:
		
			// set variables from of data sent by client
			var _shoot = buffer_read(buffer,buffer_bool)
			var _direction = buffer_read(buffer,buffer_u16)
			var _player_x = buffer_read(buffer,buffer_u16)
			var _player_y = buffer_read(buffer,buffer_u16)
			
			var _is_player = false
			
			// return instance id based off socket to player
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			_player.shoot = _shoot;
			
			// USED TO SEND DATA TO All CLIENTS - repeat this for all actions
			// loop through all clients that are moving
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{

				// store iterated client into variable
				var _sock = ds_list_find_value(socket_list,_i)
				
				// is it the current player?
				if _sock = socket
				{
					var _is_player = true
				}
	
				{
					// start at beginning of buffer
					buffer_seek(server_buffer,buffer_seek_start,0);
				
					// write to the buffer that we will be using "MOVE"
					buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.SHOOT);
				
					// write to the buffer that this is for a specific client
					buffer_write(server_buffer,buffer_u8,socket);
					
					// is it the current client?
					buffer_write(server_buffer,buffer_bool,_is_player);
				
					// write to the buffer the values of shoot and direction
					buffer_write(server_buffer,buffer_bool,_shoot);
					buffer_write(server_buffer,buffer_u16,_direction);
				
					// send a packet containing the buffer to the specified client
					network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				}
				_i++
			}
			break;
			
		case NETWORK_SERVER.FORWARD:
		
			var _forward = buffer_read(buffer,buffer_bool)
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			if _forward == true
			{
				with(_player)
				{
					motion_add(image_angle, .1)
					
				}
			}
			
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,_i)
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.FORWARD);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_bool,_forward);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER.STOP:
		
			var _stop = buffer_read(buffer,buffer_bool)
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			if _stop == true
			{
				with(_player)
				{
					if(speed > 0)
					{
						speed -= .35;
					}
				}
			}
			
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,_i)
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.STOP);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_bool,_stop);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER.LEFT:
		
			// set variables from of data sent by client
			var _left = buffer_read(buffer,buffer_bool)
			
			// return instance id based off socket to player
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			// players x and y updated from read buffer
			if _left == true
			{
				_player.image_angle+=4
			}
			
			// USED TO SEND DATA TO All CLIENTS - repeat this for all actions
			// loop through all clients that are moving
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				// store iterated client into variable
				var _sock = ds_list_find_value(socket_list,_i)
				
				// start at beginning of buffer
				buffer_seek(server_buffer,buffer_seek_start,0);
				
				// write to the buffer that we will be using "MOVE"
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.LEFT);
				
				// write to the buffer that this is for a specific client
				buffer_write(server_buffer,buffer_u8,socket);
				
				// write to the buffer the flag left
				buffer_write(server_buffer,buffer_bool,_left);
				
				// send a packet containing the buffer to the specified client
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER.RIGHT:
		
			// set variables from of data sent by client
			var _right = buffer_read(buffer,buffer_bool)
			
			// return instance id based off socket to player
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			// players x and y updated from read buffer
			if _right == true
			{
				_player.image_angle-=4
			}
			
			// USED TO SEND DATA TO All CLIENTS - repeat this for all actions
			// loop through all clients that are moving
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				// store iterated client into variable
				var _sock = ds_list_find_value(socket_list,_i)
				
				// start at beginning of buffer
				buffer_seek(server_buffer,buffer_seek_start,0);
				
				// write to the buffer that we will be using "RIGHT"
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.RIGHT);
				
				// write to the buffer that this is for a specific client
				buffer_write(server_buffer,buffer_u8,socket);
				
				// write to the buffer the flag left
				buffer_write(server_buffer,buffer_bool,_right);
				
				// send a packet containing the buffer to the specified client
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER.IS_DESTROYED:
		
			var _is_destroyed = buffer_read(buffer,buffer_bool)
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			if _is_destroyed == true
			{
				with(_player)
				{
					instance_destroy();
				}
			}
			
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,_i)
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.IS_DESTROYED);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_bool,_is_destroyed);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER.SYNC:
		
			var _player_x = buffer_read(buffer,buffer_u16)
			var _player_y = buffer_read(buffer,buffer_u16)
			var _image_angle = buffer_read(buffer,buffer_u16)
			var _direction = buffer_read(buffer,buffer_u16)
			var _speed = buffer_read(buffer,buffer_u16)
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			with(_player)
			{
				_player.x = _player_x
				_player.y = _player_y
				_player.image_angle = _image_angle
				_player.direction = _direction
				_player.speed = _speed
			}

			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,_i)
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.SYNC);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_u16,_player_x);
				buffer_write(server_buffer,buffer_u16,_player_y);
				buffer_write(server_buffer,buffer_u16,_image_angle);
				buffer_write(server_buffer,buffer_u16,_direction);
				buffer_write(server_buffer,buffer_u16,_speed);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
	}
}