buffer = argument0

function received_packet_client(buffer)
	{
	msgid = buffer_read(buffer, buffer_u8);

	switch(msgid)
	{
		case 1: //hello world
			var message = buffer_read(buffer,buffer_string);
			show_message(message);
			break;
	}
}