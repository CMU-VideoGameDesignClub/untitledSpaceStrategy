window_set_fullscreen(false);
window_set_size(1366,768)

enum NETWORK_SERVER 
{
	PLAYER_CONNECT,
	MOVE	
}

port = 64198;
max_clients = 12;

network_create_server(network_socket_tcp, port, max_clients);

server_buffer = buffer_create(1024, buffer_fixed, 1);
socket_list = ds_list_create();
socket_to_instanceid = ds_map_create();

playerSpawn_x = 100;
playerSpawn_y = 100;


audio_stop_all()