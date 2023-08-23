// our two arguments for server
buffer = argument0;
socket = argument1;

// need to declare function in script as of version 2.3
function received_packet_server_ground(buffer,socket){
	
	// read data from previously created buffer of argument0
	msgid = buffer_read(buffer, buffer_u8);
	
	switch(msgid)
	{
		// read clients username from buffer into variable
		case NETWORK_SERVER_G.PLAYER_ESTABLISHED:
			var _username = buffer_read(buffer,buffer_string);
			
			network_player_join(_username);
			global._sync_flag = true;
			
			break;
			
		case NETWORK_SERVER_G.CHAT:
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
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.CHAT);
				buffer_write(server_buffer,buffer_string,_chat);
				buffer_write(server_buffer,buffer_u8,1);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}			
			
			break;
			
		// if id from the server is SHOOT ->
		case NETWORK_SERVER_G.SHOOT:
		
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
				if _sock == socket
				{
					_is_player = true
				}
	
				{
					// start at beginning of buffer
					buffer_seek(server_buffer,buffer_seek_start,0);
				
					// write to the buffer that we will be using "MOVE"
					buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.SHOOT);
				
					// write to the buffer that this is for a specific client
					buffer_write(server_buffer,buffer_u8,socket);
					
					// is it the current client?
					buffer_write(server_buffer,buffer_bool,_is_player);
				
					// write to the buffer the values of shoot and direction
					buffer_write(server_buffer,buffer_bool,_shoot);
					buffer_write(server_buffer,buffer_u16,_direction);
				
					// send a packet containing the buffer to the specified client
					network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
					
					_is_player = false
				}
				_i++
			}
			break;
		case NETWORK_SERVER_G.POWER_SHOOT:
		
			var _shoot = buffer_read(buffer,buffer_bool)
			var _direction = buffer_read(buffer,buffer_u16)
			var _player_x = buffer_read(buffer,buffer_u16)
			var _player_y = buffer_read(buffer,buffer_u16)
			var _is_player = false
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			_player.shoot = _shoot;
			
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{

				var _sock = ds_list_find_value(socket_list,_i)
				if _sock == socket
				{
					_is_player = true
				}
	
				{
					buffer_seek(server_buffer,buffer_seek_start,0);
					buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.POWER_SHOOT);
					buffer_write(server_buffer,buffer_u8,socket);
					buffer_write(server_buffer,buffer_bool,_is_player);
					buffer_write(server_buffer,buffer_bool,_shoot);
					buffer_write(server_buffer,buffer_u16,_direction);
					network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
					_is_player = false
				}
				_i++
			}
			break;
		
		case NETWORK_SERVER_G.LEFT:
		
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
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.LEFT);
				
				// write to the buffer that this is for a specific client
				buffer_write(server_buffer,buffer_u8,socket);
				
				// write to the buffer the flag left
				buffer_write(server_buffer,buffer_bool,_left);
				
				// send a packet containing the buffer to the specified client
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER_G.RIGHT:
		
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
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.RIGHT);
				
				// write to the buffer that this is for a specific client
				buffer_write(server_buffer,buffer_u8,socket);
				
				// write to the buffer the flag left
				buffer_write(server_buffer,buffer_bool,_right);
				
				// send a packet containing the buffer to the specified client
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER_G.DAMAGED:
		
			var _damaged = buffer_read(buffer,buffer_bool)
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,_i)
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.DAMAGED);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_bool,_damaged);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER_G.RESPAWN:
		
			var _respawn = buffer_read(buffer,buffer_bool)
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			_is_player = false
			
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
			
				var _sock = ds_list_find_value(socket_list,_i)
				if _sock == socket
				{
					_is_player = true
				}
				
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.RESPAWN);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_bool,_respawn);
				buffer_write(server_buffer,buffer_bool,_is_player);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_is_player = false
				_i++
			}
			break;
			
		case NETWORK_SERVER_G.SYNC:
		
			var _player_x = buffer_read(buffer,buffer_u16)
			var _player_y = buffer_read(buffer,buffer_u16)
			var _image_angle = buffer_read(buffer,buffer_u16)
			var _direction = buffer_read(buffer,buffer_u16)
			var _speed = buffer_read(buffer,buffer_u16)
			
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			// var _is_player = false
			
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
				
				/* slave only
				if _sock == socket
				{
					var _is_player = true
				}
				*/
				
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.SYNC);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_u16,_player_x);
				buffer_write(server_buffer,buffer_u16,_player_y);
				buffer_write(server_buffer,buffer_u16,_image_angle);
				buffer_write(server_buffer,buffer_u16,_direction);
				buffer_write(server_buffer,buffer_u16,_speed);
				// buffer_write(server_buffer,buffer_bool,_is_player);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER_G.UPGRADE_THREE_SHOT:
			var _pickup = buffer_read(buffer,buffer_bool)
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			_is_player = false
			
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,_i)
				if _sock == socket
				{
					_is_player = true
				}
				
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.UPGRADE_THREE_SHOT);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_bool,_pickup);
				buffer_write(server_buffer,buffer_bool,_is_player);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
			
		case NETWORK_SERVER_G.UPGRADE_SHIELD:
			var _pickup = buffer_read(buffer,buffer_bool)
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			_is_player = false
			
			var _i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,_i)
				if _sock == socket
				{
					_is_player = true
				}
				
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.UPGRADE_SHIELD);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_bool,_pickup);
				buffer_write(server_buffer,buffer_bool,_is_player);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;	
		
	}
}