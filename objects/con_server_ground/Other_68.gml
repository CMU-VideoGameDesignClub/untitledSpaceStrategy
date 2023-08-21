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
		// playerSpawn_x +=100; might find a new home
		
		// player on server - please send info
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.PLAYER_ESTABLISHED);
		buffer_write(server_buffer,buffer_u8,socket);
		network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
		break;
		
	// when client disconnects ->
	case network_type_disconnect:
	
		// pulling value from DS map for disconnecting client
		socket = ds_map_find_value(async_load, "socket");
		
		// find position of disconnecting client and remove them from list
		ds_list_delete(socket_list,ds_list_find_index(socket_list, socket));
		
		// creating a loop that iterates through all connected sockets and checks for disconnecting players
		var _i = 0
		repeat(ds_list_size(socket_list))
		{
			// letting a player know that "this" socket has left and that you shoud delete them from the game world
			var _sock = ds_list_find_value(socket_list,_i)
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,NETWORK_SERVER_G.PLAYER_DISCONNECT);
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
		received_packet_server_ground(buffer, socket)
		break;
}