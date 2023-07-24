// our argument for client
buffer = argument0
// need to declare function in script as of version 2.3
function received_packet_client(buffer)
{
	// read data from the servers buffer containing a specified case
	msgid = buffer_read(buffer, buffer_u8);
	switch(msgid)
	{
		// when packet sent for the server says player established
		case NETWORK_CLIENT.PLAYER_ESTABLISHED:
		
			// if we ever need to know our socket instead of obj_player_client
			var _socket = buffer_read(buffer,buffer_u8);
			global.mysocket = _socket;
			
			// start at beginning of buffer
			buffer_seek(con_client.client_buffer,buffer_seek_start,0);
			buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.PLAYER_ESTABLISHED);
			buffer_write(con_client.client_buffer,buffer_string,con_mp_game.username);
			network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))
			break;
		
		// when packet sent for the server is assigned PLAYER_CONNECT
		case NETWORK_CLIENT.PLAYER_CONNECT:
			// store socket info from buffer
			var _socket = buffer_read(buffer,buffer_u8);
			// store x and y coordinate from buffer
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			// store username from buffer
			var _username = buffer_read(buffer,buffer_string);
			// create the player on client using the read info from buffer
			var _player = instance_create_depth(_x,_y,depth,obj_player_client)
			// use to find player that has this socket
			_player.socket = _socket;
			_player.username = _username;
			// add the instance id of new player to Data Structure Map
			ds_map_add(socket_to_instanceid,_socket,_player);
			break;
			
		// when packet sent for the server is assigned PLAYER_JOINED		
		case NETWORK_CLIENT.PLAYER_JOINED:
			// store socket info from buffer
			var _socket = buffer_read(buffer,buffer_u8);
			// store x and y coordinate from buffer
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			// store username from buffer
			var _username = buffer_read(buffer,buffer_string);
			// create the slave on client using the read info from buffer
			var _slave = instance_create_depth(_x,_y,depth,obj_slave_client)
			// use to find slave that has this socket
			_slave.socket = _socket;
			_slave.username = _username;
			// add the instance id of new slave to Data Structure map
			ds_map_add(socket_to_instanceid,_socket,_slave);
			break;
			
		// when packet sent for the server is assigned PLAYER_DISCONNECT	
		case NETWORK_CLIENT.PLAYER_DISCONNECT:
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
		
		// when packet sent for the server is assigned MOVE ->
		case NETWORK_CLIENT.MOVE:
			// read the buffer into a variable
			var _sock = buffer_read(buffer,buffer_u8);
			// read the buffer from server into an x and y for client 
			var move_x = buffer_read(buffer,buffer_u16);
			var move_y = buffer_read(buffer,buffer_u16);
			// find and store the specifed player or slave from the incoming buffer
			_player = ds_map_find_value(socket_to_instanceid,_sock);
			// assign the x and y from the server to "this" player or slave
			_player.x = move_x
			_player.y = move_y
			break;
	}
}