// gets value of key "type" and store in variable "type_event" - Data Structure
type_event = ds_map_find_value(async_load, "type");

// switch statement for events in Data Structure
switch(type_event)
{
	// when client connects to server ->
	case network_type_connect:
		
		// pulling value from DS map for connecting client 
		socket = ds_map_find_value(async_load, "socket");
		// add the client to the list
		ds_list_add(socket_list, socket);
		// update new player positioning
		playerSpawn_x +=100;
		// create a new player object in the room at specified posistion
		var _player = instance_create_depth(playerSpawn_x,playerSpawn_y, depth, obj_player_server)
		// add object to Data Structure
		ds_map_add(socket_to_instanceid,socket,_player)
		
		// start from top of buffer
		buffer_seek(server_buffer, buffer_seek_start,0);
		// send out PLAYER_CONNECT event
		buffer_write(server_buffer, buffer_u8,NETWORK_SERVER.PLAYER_CONNECT);
		// send out socket of the player
		buffer_write(server_buffer, buffer_u8,socket);
		// send out the connected players x and y coordinates
		buffer_write(server_buffer, buffer_u16,_player.x);
		buffer_write(server_buffer, buffer_u16,_player.y);
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
				buffer_write(server_buffer, buffer_u8,NETWORK_SERVER.PLAYER_JOINED);
				buffer_write(server_buffer, buffer_u8,_sock);
				buffer_write(server_buffer, buffer_u16,_slave.x);
				buffer_write(server_buffer, buffer_u16,_slave.y);
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
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
			}
			_i++;
		}
		
		break;
		
	// when client disconnects ->
	case network_type_disconnect:
	
		// pulling value from DS map for disconnecting client
		socket = ds_map_find_value(async_load, "socket");
		
		// find position of disconnecting client and remove them from list
		ds_list_delete(socket_list,ds_list_find_index(socket_list, socket));
		
		// creating a loop that iterates through all players and 
		var _i = 0
		repeat(ds_list_size(socket_list))
		{
			var _sock = ds_list_find_value(socket_list,_i)
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.PLAYER_DISCONECT);
			buffer_write(server_buffer,buffer_u8,socket);
			network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
			
			_i++
		}
		// when player disconnects we can destroy their object in on server -
		with(ds_map_find_value(socket_to_instanceid,socket))
		{
			instance_destroy();
		}
		// - and delete from Data Structure Map
		ds_map_delete(socket_to_instanceid,socket);
		break;
	
	// when packet is received from client ->	
	case network_type_data:
	
		// grab the buffer
		buffer = ds_map_find_value(async_load, "buffer");
		// unique id of the client that sent information
		socket = ds_map_find_value(async_load, "id");
		// going to the start of buffer
		buffer_seek(buffer, buffer_seek_start, 0);
		
		// script of possibilities
		received_packet_server(buffer, socket)
		break;
}