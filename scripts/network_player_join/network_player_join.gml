var _username = argument0

function network_player_join(_username){
	// create a new player object in the room at specified posistion
	var _player = instance_create_depth(playerSpawn_x,playerSpawn_y, depth, obj_player_server)
	_player.username = _username;
		
	// add object to Data Structure
	ds_map_add(socket_to_instanceid,socket,_player)
		
	// start from top of buffer
	buffer_seek(server_buffer, buffer_seek_start,0);
	// send out PLAYER_CONNECT event (player)
	buffer_write(server_buffer, buffer_u8,NETWORK_SERVER.PLAYER_CONNECT);
	// send out socket of the player
	buffer_write(server_buffer, buffer_u8,socket);
	// send out the connected players x and y coordinates
	buffer_write(server_buffer, buffer_u16,_player.x);
	buffer_write(server_buffer, buffer_u16,_player.y);
	buffer_write(server_buffer, buffer_string,_player.username);
	// send the packet containing buffer to player
	network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
		
	// iterator set to 0 - loop to send data to all clients
	// used for new client to see already connected players as slaves (objects used to represent other players on the server)
	var _i = 0;
	repeat(ds_list_size(socket_list))
	{
		// set variable to place on list
		var _sock = ds_list_find_value(socket_list,_i);
			
		// if not current connected player
		if _sock != socket
		{
			// getting instance id of everone already connected
			var _slave = ds_map_find_value(socket_to_instanceid,_sock)
			// send the current location of the connected players as slaves
			buffer_seek(server_buffer, buffer_seek_start,0);
			// send out PLAYER_JOINED event (slave)
			buffer_write(server_buffer, buffer_u8,NETWORK_SERVER.PLAYER_JOINED);
			buffer_write(server_buffer, buffer_u8,_sock);
			buffer_write(server_buffer, buffer_u16,_slave.x);
			buffer_write(server_buffer, buffer_u16,_slave.y);
			buffer_write(server_buffer, buffer_string,_slave.username);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
		}
		_i++;
	}
	// iterator set to 0 - loop to send data to all clients
	// used for already connected players to see location of a new player
	var _i = 0;
	repeat(ds_list_size(socket_list))
	{
		// set variable to place on list
		var _sock = ds_list_find_value(socket_list,_i);
		// if not current connected player
		if _sock != socket
		{
			// send the location spawn info of a new player to the other currently connected clients 
			buffer_seek(server_buffer, buffer_seek_start,0);
			buffer_write(server_buffer, buffer_u8,NETWORK_SERVER.PLAYER_JOINED);
			buffer_write(server_buffer, buffer_u8,socket);
			buffer_write(server_buffer, buffer_u16,_player.x);
			buffer_write(server_buffer, buffer_u16,_player.y);
			buffer_write(server_buffer, buffer_string,_player.username);
			network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
		}
		_i++;
	}
}