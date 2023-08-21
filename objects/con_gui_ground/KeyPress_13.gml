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
	
	chat_text = "SERVER: "+chat_text;
	ds_list_insert(global.chat,0,chat_text);
	ds_list_insert(global.chat_color,0,c_red);
	
	// send data to clients
	var _i = 0;
	repeat(ds_list_size(con_server_ground.socket_list))
	{
		// store iterated client into variable
		var _sock = ds_list_find_value(con_server_ground.socket_list,_i)
				
		buffer_seek(con_server_ground.server_buffer,buffer_seek_start,0);
		buffer_write(con_server_ground.server_buffer,buffer_u8,NETWORK_SERVER_G.CHAT);
		buffer_write(con_server_ground.server_buffer,buffer_string,chat_text);
		buffer_write(con_server_ground.server_buffer,buffer_u8,2);
		network_send_packet(_sock,server_buffer,buffer_tell(con_server_ground.server_buffer));
		_i++
	}			
	
}