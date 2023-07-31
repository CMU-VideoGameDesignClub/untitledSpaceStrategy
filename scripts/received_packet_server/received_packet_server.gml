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
		
		// if id from the server is MOVE ->
		case NETWORK_SERVER.MOVE:
		
			// set x and y values from the two pieces of data sent by client
			var move_x = buffer_read(buffer,buffer_u16)
			var move_y = buffer_read(buffer,buffer_u16)
			
			// return instance id based off socket to player
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			// players x and y updated from read buffer
			_player.x = move_x;
			_player.y = move_y;
			
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
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.MOVE);
				
				// write to the buffer that this is for a specific client
				buffer_write(server_buffer,buffer_u8,socket);
				
				// write to the buffer the values of x and y
				buffer_write(server_buffer,buffer_u16,move_x);
				buffer_write(server_buffer,buffer_u16,move_y);
				
				// send a packet containing the buffer to the specified client
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
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
			
			// return instance id based off socket to player
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			// players x and y updated from read buffer
			_player.shoot = _shoot;
			_player.direction = _direction;
			
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
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.SHOOT);
				
				// write to the buffer that this is for a specific client
				buffer_write(server_buffer,buffer_u8,socket);
				
				// write to the buffer the values of shoot and direction
				buffer_write(server_buffer,buffer_bool,_shoot);
				buffer_write(server_buffer,buffer_u16,_direction);
				
				// send a packet containing the buffer to the specified client
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				_i++
			}
			break;
		case NETWORK_SERVER.FORWARD:
		
			// set variables from of data sent by client
			var _forward = buffer_read(buffer,buffer_bool)
			var _angle = buffer_read(buffer,buffer_u16)
			
			
			// return instance id based off socket to player
			var _player = ds_map_find_value(socket_to_instanceid,socket)
			
			_player.image_angle = _angle
			
			// players x and y updated from read buffer
			if _forward == true
			{
				motion_add(_player.image_angle,.1)
				//_player.speed+=.1
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
				buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.FORWARD);
				
				// write to the buffer that this is for a specific client
				buffer_write(server_buffer,buffer_u8,socket);
				
				// write to the buffer the flag forward
				buffer_write(server_buffer,buffer_bool,_forward);
				
				buffer_write(server_buffer,buffer_u16,_angle);
				
				// send a packet containing the buffer to the specified client
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
	}
}