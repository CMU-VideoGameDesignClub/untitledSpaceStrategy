displayX = 1920;
displayY = 1080;

move_wrap(true, true, 0)

camera_set_view_size(view_camera[0], displayX + (obj_player_client.speed*obj_player_client.speed)*1.6, displayY + (obj_player_client.speed*obj_player_client.speed)*.9);

	// sync rate to clients
if(sync_rate <= 0)
{	
		
	buffer_seek(con_client.client_buffer,buffer_seek_start,0);
	buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.SYNC);
	buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.x);
	buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.y);
	buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.image_angle);
	buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.direction);
	buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.speed);
	network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))
			
	sync_rate = (5*room_speed);
}
	sync_rate -= 1;

if shield = true
{
	with (instance_create_layer(x, y, "Instances", obj_shield)){
		obj_shield.x = x;
		obj_shield.y = y;
	}
}
if shield == false
{
	if instance_exists(obj_shield)
	{
		instance_destroy(obj_shield)
	}
}