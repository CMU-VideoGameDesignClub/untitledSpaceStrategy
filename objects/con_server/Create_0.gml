// testing purposes
window_set_fullscreen(false);
window_set_size(1366,768)
// stops all game sounds when server starts
audio_stop_all()

// MUST MATCH ENUM NETWORK_CLIENT
// "find and replace" keywords with numerical constants starting with 0
enum NETWORK_SERVER 
{
	PLAYER_ESTABLISHED,
	PLAYER_CONNECT,
	PLAYER_JOINED,
	PLAYER_DISCONNECT,
	CHAT,
	SHOOT,
	FORWARD,
	STOP,
	LEFT,
	RIGHT,
	IS_DESTROYED,
	SYNC,
}

// arbitrary port number and max client
port = 64198;
max_clients = 12;

// create server with tcp protocol w/ port and client values
network_create_server(network_socket_tcp, port, max_clients);

// create fixed buffer at 1MB 
server_buffer = buffer_create(1024, buffer_fixed, 1);
// unique id for client that has connected
socket_list = ds_list_create();
// create system where server is storing sockets of the player for instance id
socket_to_instanceid = ds_map_create();

// player spawns at server at specific coordinates
playerSpawn_x = room_width/2;
playerSpawn_y = room_height/2;

