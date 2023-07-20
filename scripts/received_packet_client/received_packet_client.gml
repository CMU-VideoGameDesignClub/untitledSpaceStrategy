buffer = argument0

function received_packet_client(buffer)
{
	msgid = buffer_read(buffer, buffer_u8);

	switch(msgid)
	{
		case NETWORK_CLIENT.PLAYER_CONNECT:
			var _socket = buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			
			break;
		
		case NETWORK_CLIENT.MOVE:
			var move_x = buffer_read(buffer,buffer_u16);
			var move_y = buffer_read(buffer,buffer_u16);
			
			obj_player_client.x = move_x
			obj_player_client.y = move_y
			
			break;
	}
}