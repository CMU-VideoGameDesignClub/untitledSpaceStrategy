// start at beginning of buffer
buffer_seek(con_client.client_buffer,buffer_seek_start,0);
// write to the bufferthat we will be using "MOVE"
buffer_write(con_client.client_buffer,buffer_u8,NETWORK_CLIENT.MOVE);
// write to the buffer the x position of the mouse
buffer_write(con_client.client_buffer,buffer_u16,mouse_x);
// write to the buffer the y position of the mouse
buffer_write(con_client.client_buffer,buffer_u16,mouse_y);
// send a packet containing the buffer to the server
network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer))