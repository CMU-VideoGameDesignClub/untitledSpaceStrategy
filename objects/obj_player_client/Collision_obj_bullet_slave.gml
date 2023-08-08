is_destroyed = true
con_client.alarm[0] = 400;


buffer_seek(con_client.client_buffer,buffer_seek_start,0);
buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.IS_DESTROYED);
buffer_write(con_client.client_buffer,buffer_bool,is_destroyed);
network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))
