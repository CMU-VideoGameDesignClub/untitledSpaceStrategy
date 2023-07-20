buffer = argument0

function received_packet_client(buffer)
	{
	msgid = buffer_read(buffer, buffer_u8);

	switch(msgid)
	{
		case 1:
			obj_player_client.image_index = 1;
			break;
	}
}