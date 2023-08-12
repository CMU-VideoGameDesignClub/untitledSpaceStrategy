damaged = true
con_client.alarm[0] = 400;

buffer_seek(con_client.client_buffer,buffer_seek_start,0);
buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.DAMAGED);
buffer_write(con_client.client_buffer,buffer_bool,damaged);
network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))