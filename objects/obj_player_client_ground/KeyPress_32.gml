if three_shot == false
{
	buffer_seek(con_client_ground.client_buffer,buffer_seek_start,0);
	buffer_write(con_client_ground.client_buffer,buffer_u8,NETWORK_CLIENT_G.SHOOT);
	buffer_write(con_client_ground.client_buffer,buffer_bool,true);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.image_angle);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.x);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.y);
	network_send_packet(con_client_ground.client,con_client_ground.client_buffer,buffer_tell(con_client_ground.client_buffer))
}
else
{
	buffer_seek(con_client_ground.client_buffer,buffer_seek_start,0);
	buffer_write(con_client_ground.client_buffer,buffer_u8,NETWORK_CLIENT_G.POWER_SHOOT);
	buffer_write(con_client_ground.client_buffer,buffer_bool,true);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.image_angle);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.x);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.y);
	network_send_packet(con_client_ground.client,con_client_ground.client_buffer,buffer_tell(con_client_ground.client_buffer))
}