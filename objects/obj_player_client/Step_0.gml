/* in progress
if keyboard_check(ord("W"))
{
	 motion_add(image_angle, .1)
}
if keyboard_check(ord("S"))
{
	if(obj_player_client.speed > 0){
		obj_player_client.speed -= .35;
	}
}
if keyboard_check(ord("A"))
{
	 image_angle += 4;
}
if keyboard_check(ord("D"))
{
	 image_angle -= 4;
}

/*
// start at beginning of buffer
buffer_seek(con_client.client_buffer,buffer_seek_start,0);
// write to the bufferthat we will be using "MOVE"
buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.MOVE);
// write to the buffer the x position of the mouse
buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.x);
// write to the buffer the y position of the mouse
buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.y);
// send a packet containing the buffer to the server
network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))