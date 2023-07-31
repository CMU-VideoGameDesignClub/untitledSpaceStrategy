forward_motion = true
current_angle = obj_player_client.image_angle;

buffer_seek(con_client.client_buffer,buffer_seek_start,0);
buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.FORWARD);
buffer_write(con_client.client_buffer,buffer_bool,forward_motion);
buffer_write(con_client.client_buffer,buffer_u16,current_angle);
network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))

forward_motion = false