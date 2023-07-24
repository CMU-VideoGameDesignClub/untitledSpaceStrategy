// our argument for client
buffer = argument0

// need to declare function in script as of version 2.3
function received_packet_client(buffer)
{
	// read data from the servers buffer containing a specified case
	msgid = buffer_read(buffer, buffer_u8);

	switch(msgid)
	{

		case NETWORK_CLIENT.PLAYER_CONNECT:
		
			// store socket info from buffer
			var _socket = buffer_read(buffer,buffer_u8);
			
			// store x and y coordinate from buffer
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			
			// create the player on client using the read info from buffer
			var _player = instance_create_depth(_x,_y,depth,obj_player_client)
			
			// use to find player that has this socket
			_player.socket = _socket;
			
			// add the instance id of new player to Data Structure Map
			ds_map_add(socket_to_instanceid,_socket,_player);
			break;
			
		case NETWORK_CLIENT.PLAYER_JOINED:
		
			// store socket info from buffer
			var _socket = buffer_read(buffer,buffer_u8);
			
			// store x and y coordinate from buffer
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			
			// create the slave on client using the read info from buffer
			var _slave = instance_create_depth(_x,_y,depth,obj_slave_client)
			
			// use to find slave that has this socket
			_slave.socket = _socket;
			
			// add the instance id of new slave to Data Structure map
			ds_map_add(socket_to_instanceid,_socket,_slave);
			break;
			
		case NETWORK_CLIENT.PLAYER_DISCONNECT:
			var _socket = buffer_read(buffer,buffer_u8);
			var _player = ds_map_find_value(socket_to_instanceid,_socket);
			
			with(_player)
			{
				instance_destroy();
			}
			
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