audio_play_sound(laser1, 2, false);
speed = 40;
with(obj_player_space){
	direction = obj_player_space.image_angle;
	image_angle = direction;
}
with(friendly_fighter){
	direction = friendly_fighter.image_angle;
	image_angle = direction;
}
