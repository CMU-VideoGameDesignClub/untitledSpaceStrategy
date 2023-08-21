damaged = true
con_client_ground.alarm[0] = 400;

instance_destroy(other)

buffer_seek(con_client_ground.client_buffer,buffer_seek_start,0);
buffer_write(con_client_ground.client_buffer,buffer_u8,NETWORK_CLIENT_G.DAMAGED);
buffer_write(con_client_ground.client_buffer,buffer_bool,damaged);
network_send_packet(con_client_ground.client,con_client_ground.client_buffer,buffer_tell(con_client_ground.client_buffer))
