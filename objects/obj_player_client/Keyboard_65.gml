left_turn = true

buffer_seek(con_client.client_buffer,buffer_seek_start,0);
buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.LEFT);
buffer_write(con_client.client_buffer,buffer_bool,left_turn);
network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))

left_turn = false

