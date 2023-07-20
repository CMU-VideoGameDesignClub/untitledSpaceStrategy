buffer = argument0;
socket = argument1;

function received_packet_server(buffer,socket){
	msgid = buffer_read(buffer, buffer_u8);


	switch(msgid)
	{
		case 1: //hello world
			var message = buffer_read(buffer,buffer_string);
		
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,1);
			buffer_write(server_buffer,buffer_string,message);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
			break;
	}
}