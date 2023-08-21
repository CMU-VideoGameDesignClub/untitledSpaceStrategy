// our argument for client
buffer = argument0
// need to declare function in script as of version 2.3
function received_packet_client_ground(buffer)
{
	// read data from the servers buffer containing a specified case
	msgid = buffer_read(buffer, buffer_u8);
	switch(msgid)
	{
		// when packet sent for the server says player established
		case NETWORK_CLIENT_G.PLAYER_ESTABLISHED:
		
			// if we ever need to know our socket instead of obj_player_client
			var _socket = buffer_read(buffer,buffer_u8);
			global.mysocket = _socket;
			
			// start at beginning of buffer
			buffer_seek(client_buffer,buffer_seek_start,0);
			buffer_write(client_buffer,buffer_u8,NETWORK_CLIENT_G.PLAYER_ESTABLISHED);
			buffer_write(client_buffer,buffer_string,con_mp_game_ground.username);
			network_send_packet(client,client_buffer,buffer_tell(client_buffer))
			break;
		
		// when packet sent for the server is assigned PLAYER_CONNECT
		case NETWORK_CLIENT_G.PLAYER_CONNECT:
			// store socket info from buffer
			var _socket = buffer_read(buffer,buffer_u8);
			// store x and y coordinate from buffer
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			// store username from buffer
			var _username = buffer_read(buffer,buffer_string);
			// create the player on client using the read info from buffer
			var _player = instance_create_depth(_x,_y,depth,obj_player_client_ground)
			// use to find player that has this socket
			_player.socket = _socket;
			_player.username = _username;
			// add the instance id of new player to Data Structure Map
			ds_map_add(socket_to_instanceid,_socket,_player);
			break;
			
		// when packet sent for the server is assigned PLAYER_JOINED		
		case NETWORK_CLIENT_G.PLAYER_JOINED:
			// store socket info from buffer
			var _socket = buffer_read(buffer,buffer_u8);
			// store x and y coordinate from buffer
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			// store username from buffer
			var _username = buffer_read(buffer,buffer_string);
			// create the slave on client using the read info from buffer
			var _slave = instance_create_depth(_x,_y,depth,obj_slave_client_ground)
			// use to find slave that has this socket
			_slave.socket = _socket;
			_slave.username = _username;
			// add the instance id of new slave to Data Structure map
			ds_map_add(socket_to_instanceid,_socket,_slave);
			break;
			
		// when packet sent for the server is assigned PLAYER_DISCONNECT	
		case NETWORK_CLIENT_G.PLAYER_DISCONNECT:
			// find the player from received buffer who is disconnecting
			var _socket = buffer_read(buffer,buffer_u8);
			var _player = ds_map_find_value(socket_to_instanceid,_socket);
			// destroy the disconnecting player on the client
			with(_player)
			{
				instance_destroy();
			}
			// remove the socket from the Data Structure Map
			ds_map_delete(socket_to_instanceid,_socket);
			break;
			
		case NETWORK_CLIENT_G.CHAT:
			var _chat = buffer_read(buffer,buffer_string);
			var _color = buffer_read(buffer,buffer_u8);
			ds_list_insert(global.chat,0,_chat);
			
			if _color = 1 // Client Color
				ds_list_insert(global.chat_color,0,c_white);
			if _color = 2 // Server Color
				ds_list_insert(global.chat_color,0,c_red);
			break

		case NETWORK_CLIENT_G.SHOOT:
			// read the buffer into a variable
			var _sock = buffer_read(buffer,buffer_u8);
			var _is_player = buffer_read(buffer,buffer_bool)
			// read the buffer from server into a shoot and direction var for client 
			var _shoot = buffer_read(buffer,buffer_bool);
			var _direction = buffer_read(buffer,buffer_u16);
			// find and store the specifed player or slave from the incoming buffer
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			// assign the x and y from the server to "this" player or slave
			if _shoot == true
			{
				if _is_player
				{
					with (instance_create_layer(_player.x, _player.y, "Instances", obj_bullet)){
						direction = _direction;
						image_angle = direction;
					}
				}
				else
				{	
						with (instance_create_layer(_player.x, _player.y, "Instances", obj_bullet_slave)){
						direction = _direction;
						image_angle = direction;
					}
				}
			}
			break;
			
		case NETWORK_CLIENT_G.POWER_SHOOT:
			var _sock = buffer_read(buffer,buffer_u8);
			var _is_player = buffer_read(buffer,buffer_bool)
			var _shoot = buffer_read(buffer,buffer_bool);
			var _direction = buffer_read(buffer,buffer_u16);
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			if _shoot == true
			{
				if _is_player
				{
					with (instance_create_layer(_player.x, _player.y, "Instances", obj_bullet)){
						direction = _direction;
						image_angle = direction;
					}
					with (instance_create_layer(_player.x, _player.y, "Instances", obj_bullet)){
						direction = _direction-10;
						image_angle = direction;
					}
					with (instance_create_layer(_player.x, _player.y, "Instances", obj_bullet)){
						direction = _direction+10;
						image_angle = direction;
					}
				}
				else
				{	
					with (instance_create_layer(_player.x, _player.y, "Instances", obj_bullet_slave)){
						direction = _direction;
						image_angle = direction;
					}
					with (instance_create_layer(_player.x, _player.y, "Instances", obj_bullet_slave)){
						direction = _direction-10;
						image_angle = direction;
					}
					with (instance_create_layer(_player.x, _player.y, "Instances", obj_bullet_slave)){
						direction = _direction+10;
						image_angle = direction;
					}
				}
			}
			break;	
			
		case NETWORK_CLIENT_G.FORWARD:
			var _sock = buffer_read(buffer,buffer_u8);
			var _forward = buffer_read(buffer,buffer_bool);
			//var _direction = buffer_read(buffer,buffer_u16)
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			
			if _forward == true
			{
				with(_player)
				{
					motion_add(image_angle, .1)
				}
			}
			break;
			
		case NETWORK_CLIENT_G.STOP:
			var _sock = buffer_read(buffer,buffer_u8);
			var _stop = buffer_read(buffer,buffer_bool);
			_player = ds_map_find_value(socket_to_instanceid,_sock);
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
			break;
			
		case NETWORK_CLIENT_G.LEFT:
			var _sock = buffer_read(buffer,buffer_u8);
			var _left = buffer_read(buffer,buffer_bool);
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			if _left == true
			{
				with(_player)
				{
					image_angle+=4
				}
			}
			break;
			
		case NETWORK_CLIENT_G.RIGHT:
			var _sock = buffer_read(buffer,buffer_u8);
			var _right = buffer_read(buffer,buffer_bool);
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			if _right == true
			{
				with(_player)
				{
					image_angle-=4
				}
			}
			break;	
			
		case NETWORK_CLIENT_G.DAMAGED:
			var _sock = buffer_read(buffer,buffer_u8);
			var _damaged = buffer_read(buffer,buffer_bool);
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			if _damaged == true
			{		
				with(_player)
				{
					if _player.shield == true
					{
						audio_play_sound(snd_shield_break,2,false)
					}
					if _player.shield == false
					{
						effect_create_above(ef_explosion, x, y, 1, c_orange);
						audio_play_sound(snd_explosion1, 2, false);
						sprite_index = spr_null
						three_shot = false;
					}
					_player.shield = false;
				}
			}
			break;
			
		case NETWORK_CLIENT_G.RESPAWN:
			var _sock = buffer_read(buffer,buffer_u8);
			var _respawn = buffer_read(buffer,buffer_bool);
			var _is_player = buffer_read(buffer,buffer_bool);
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			if _respawn == true
			{
				if _is_player
				{
					with(_player)
					{
						// instance_destroy(); make invisible!
						effect_create_above(ef_ring, x, y, 1, c_green);
						audio_play_sound(snd_respawn, 2, false);
						sprite_index = spr_player
					}
				}
				
				else
				{
					with(_player)
					{
						// instance_destroy(); make invisible!
						effect_create_above(ef_ring, x, y, 1, c_green);
						audio_play_sound(snd_respawn, 2, false);
						sprite_index = spr_player
					}
				}
			}
			break;
			
		case NETWORK_CLIENT_G.SYNC:
			var _sock = buffer_read(buffer,buffer_u8);
			var _player_x = buffer_read(buffer,buffer_u16)
			var _player_y = buffer_read(buffer,buffer_u16)
			var _image_angle = buffer_read(buffer,buffer_u16)
			var _direction = buffer_read(buffer,buffer_u16)
			var _speed = buffer_read(buffer,buffer_u16)
			
			// sync only slaves?
			// var _is_player = buffer_read(buffer,buffer_bool) 
			
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			
			// if _is_player == false
			{
				with(_player)
				{
					_player.x = _player_x
					_player.y = _player_y
					_player.image_angle = _image_angle
					_player.direction = _direction
					_player.speed = _speed
				}
			}
			break;
			
		case NETWORK_CLIENT_G.UPGRADE_THREE_SHOT:
			var _sock = buffer_read(buffer,buffer_u8);
			var _is_player = buffer_read(buffer,buffer_bool)
			var _pickup = buffer_read(buffer,buffer_bool);
			_player = ds_map_find_value(socket_to_instanceid,_sock);

			if _pickup
			{
				_player.three_shot = true
				audio_play_sound(snd_power_up, 2, false)
			}
			break;
			
		case NETWORK_CLIENT_G.UPGRADE_SHIELD:
			var _sock = buffer_read(buffer,buffer_u8);
			var _pickup = buffer_read(buffer,buffer_bool)
			var _is_player = buffer_read(buffer,buffer_bool);
			_player = ds_map_find_value(socket_to_instanceid,_sock);

			if _pickup
			{
				_player.shield = true
				
				audio_play_sound(snd_power_up, 2, false)
			}
			break;
			
		case NETWORK_CLIENT_G.ROCK:
			obj_rock_server.x = buffer_read(buffer,buffer_u16)
			obj_rock_server.y = buffer_read(buffer,buffer_u16)
			obj_rock_server.image_angle = buffer_read(buffer,buffer_u16)
			obj_rock_server.direction = buffer_read(buffer,buffer_u16)
			obj_rock_server.speed = buffer_read(buffer,buffer_u16)

	}
}