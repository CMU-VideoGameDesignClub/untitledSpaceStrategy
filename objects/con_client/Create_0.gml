window_set_fullscreen(false);
window_set_size(1366,768)

enum NETWORK_CLIENT 
{
	PLAYER_CONNECT,
	MOVE
}

client = network_create_socket(network_socket_tcp);
network_connect(client, "121.0.0.2", 64198);

client_buffer = buffer_create(1024, buffer_fixed,1);
