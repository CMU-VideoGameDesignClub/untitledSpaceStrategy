right_turn = true

buffer_seek(con_client_ground.client_buffer,buffer_seek_start,0);
buffer_write(con_client_ground.client_buffer,buffer_u8,NETWORK_CLIENT_G.RIGHT);
buffer_write(con_client_ground.client_buffer,buffer_bool,right_turn);
network_send_packet(con_client_ground.client,con_client_ground.client_buffer,buffer_tell(con_client_ground.client_buffer))

right_turn = false

