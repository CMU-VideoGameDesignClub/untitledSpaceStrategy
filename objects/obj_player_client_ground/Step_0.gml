displayX = 1920;
displayY = 1080;

move_wrap(true, true, 0)

camera_set_view_size(view_camera[0], displayX + (obj_player_client_ground.speed*obj_player_client_ground.speed)*1.6, displayY + (obj_player_client_ground.speed*obj_player_client_ground.speed)*.9);

	// sync rate to clients
if(sync_rate <= 0)
{	
		
	buffer_seek(con_client_ground.client_buffer,buffer_seek_start,0);
	buffer_write(con_client_ground.client_buffer,buffer_u8,NETWORK_CLIENT_G.SYNC);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.x);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.y);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.image_angle);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.direction);
	buffer_write(con_client_ground.client_buffer,buffer_u16,obj_player_client_ground.speed);
	network_send_packet(con_client_ground.client,con_client_ground.client_buffer,buffer_tell(con_client_ground.client_buffer))
			
	sync_rate = (5*room_speed);
}
	sync_rate -= 1;

if shield = true
{
	with (instance_create_layer(x, y, "Instances", obj_shield)){
		obj_shield.x = x;
		obj_shield.y = y;
		
		if obj_player_client_ground.damaged == true 
		{
			instance_destroy(obj_shield)
			shield = false
		}
	}
}