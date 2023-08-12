sync_rate = 0;
global._sync_flag = false;

if room == rm_server
{
	x = random(room_height)
	y = random(room_width)

	speed = random(4);
	direction = random(360);
	image_angle = random(360);
	
	if room == rm_server
	{
		var _i = 0;
		repeat(ds_list_size(con_server.socket_list))
		{
			var _sock = ds_list_find_value(con_server.socket_list,_i)

			buffer_seek(con_server.server_buffer,buffer_seek_start,0);
			buffer_write(con_server.server_buffer,buffer_u8,NETWORK_CLIENT.ROCK);
			buffer_write(con_server.server_buffer,buffer_u16,x);
			buffer_write(con_server.server_buffer,buffer_u16,y);
			buffer_write(con_server.server_buffer,buffer_u16,image_angle)
			buffer_write(con_server.server_buffer,buffer_u16,direction);
			buffer_write(con_server.server_buffer,buffer_u16,speed);
			network_send_packet(_sock,con_server.server_buffer,buffer_tell(con_server.server_buffer))
			_i++
		}
	}
}