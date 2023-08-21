// on and off on press
if active = false
{
	// turn chat on
	active = true
	
	// clear chat text
	keyboard_string = "";
	chat_text = "";
}
else
{
	// turn chat off
	active = false
	
	// Send data to server
	buffer_seek(con_client_ground.client_buffer,buffer_seek_start,0);
	buffer_write(con_client_ground.client_buffer,buffer_u8,NETWORK_CLIENT_G.CHAT);
	buffer_write(con_client_ground.client_buffer,buffer_string,chat_text);
	network_send_packet(con_client_ground.client,con_client_ground.client_buffer,buffer_tell(con_client_ground.client_buffer))	
	
}