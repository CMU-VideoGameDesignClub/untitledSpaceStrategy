if distance_to_object(obj_player_space) <= 100 {
	if keyboard_check(vk_enter)
	{
		room_goto(planetGround)
		audio_stop_sound(backgroundSound)
		audio_play_sound(calm_piano, 2, true);
	}
}
