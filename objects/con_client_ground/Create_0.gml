// testing purposes
window_set_fullscreen(false);
window_set_size(854,480)

// play cool af music
audio_stop_all()
audio_play_sound(snd_jakim_whatever_it_means, 2, true)
// MUST MATCH ENUM NETWORK_SERVER
// "find and replace" keywords with numerical constants starting with 0
enum NETWORK_CLIENT_G 
{
	PLAYER_ESTABLISHED,
	PLAYER_CONNECT,
	PLAYER_JOINED,
	PLAYER_DISCONNECT,
	CHAT,
	SHOOT,
	POWER_SHOOT,
	//FORWARD,
	//STOP,
	LEFT,
	RIGHT,
	DAMAGED,
	RESPAWN,
	SYNC,
	UPGRADE_THREE_SHOT,
	UPGRADE_SHIELD,
	//ROCK,
	JUMP,
}
// create new client socket using tcp protocol into variable client
client = network_create_socket(network_socket_tcp);
// send client request to connect to our our server using a url(ip) and port 
network_connect(client, "127.0.0.1", 64198);
// create buffer for the client at size 1MB
client_buffer = buffer_create(1024, buffer_fixed,1);
// variable that holds new Data Structure Map
socket_to_instanceid = ds_map_create();

playerSpawn_x = room_width/2;
playerSpawn_y = room_height/2;

