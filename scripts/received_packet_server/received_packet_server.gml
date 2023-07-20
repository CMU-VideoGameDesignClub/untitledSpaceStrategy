buffer = argument0;
socket = argument1;

function received_packet_server(buffer,socket){
	msgid = buffer_read(buffer, buffer_u8);


	switch(msgid)
	{
		case NETWORK_SERVER.MOVE:
			var move_x = buffer_read(buffer,buffer_u16)
			var move_y = buffer_read(buffer,buffer_u16)
		
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,NETWORK_SERVER.MOVE);
			buffer_write(server_buffer,buffer_u16,move_x);
			buffer_write(server_buffer,buffer_u16,move_y);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
			break;
	}
}