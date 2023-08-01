// start at beginning of buffer
buffer_seek(con_client.client_buffer,buffer_seek_start,0);
// write to the bufferthat we will be using "SHOOT"
buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.SHOOT);
// write if space was pressed
buffer_write(con_client.client_buffer,buffer_bool,true);
// write to the buffer the "direction or image angle" of the player
buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.image_angle);
// write to the buffer the x/y position of the player
buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.x);
buffer_write(con_client.client_buffer,buffer_u16,obj_player_client.y);
// send a packet containing the buffer to the server
network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))