// testing purposes
window_set_fullscreen(false);
window_set_size(1366,768)

// play cool af music
audio_stop_all()
audio_play_sound(snd_space_cartel, 2, true)

// MUST MATCH ENUM NETWORK_SERVER
// "find and replace" keywords with numerical constants starting with 0
enum NETWORK_CLIENT 
{
	PLAYER_CONNECT,
	PLAYER_JOINED,
	PLAYER_DISCONNECT,
	MOVE
}

// create new client socket using tcp protocol into variable client
client = network_create_socket(network_socket_tcp);

// send client request to connect to our our server using a url(ip) and port 
network_connect(client, "121.0.0.2", 64198);

// create buffer for the client at size 1MB
client_buffer = buffer_create(1024, buffer_fixed,1);

// variable that holds new Data Structure Map
socket_to_instanceid = ds_map_create();
