// our two arguments for server
buffer = argument0;
socket = argument1;

// need to declare function in script as of version 2.3
function received_packet_server(buffer,socket){
	
	// read data from previously created buffer of argument0
	msgid = buffer_read(buffer, buffer_u8);

	switch(msgid)
	{
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
	}
}