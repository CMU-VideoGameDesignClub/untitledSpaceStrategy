if instance_exists(obj_player_space){
	if distance_to_object(obj_player_space) <= 2500 {
	    audio_play_sound(snd_laser1, 1, false)
	}
	if audio_is_playing(snd_laser1) {
	    var Sub = distance_to_object(obj_player_space)/2500
	    audio_sound_gain(snd_laser1, 1 - Sub, 0)
	}
}

if instance_exists(obj_player_ground){
	if distance_to_object(obj_player_ground) <= 2500 {
	    audio_play_sound(snd_laser1, 1, false)
	}
	if audio_is_playing(snd_laser1) {
	    var Sub = distance_to_object(obj_player_ground)/2500
	    audio_sound_gain(snd_laser1, 1 - Sub, 0)
	}
}

// for multiplayer // might switch to obj_bullet_multiplayer
if instance_exists(obj_player_client){
	if distance_to_object(obj_player_client) <= 2500 {
	    audio_play_sound(snd_laser1, 1, false)
	}
	if audio_is_playing(snd_laser1) {
	    var Sub = distance_to_object(obj_player_client)/2500
	    audio_sound_gain(snd_laser1, 1 - Sub, 0)
	}
}



//audio_play_sound(laser1, 2, false);
speed = 40;

