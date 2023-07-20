if distance_to_object(obj_player_space) <= 100 {
	if keyboard_check(vk_enter) && obj_player_space.shieldUp < 3 && obj_player_space.scrap >= 100
	{
		obj_player_space.shieldUp = 3
		effect_create_above(ef_ring, obj_player_space.x,obj_player_space.y, 0, c_aqua);
		audio_play_sound(snd_shield_absorb, 2, false);
		obj_player_space.scrap -= 100;
		audio_play_sound(snd_scrap_spend, 2, false);
	}
}
if distance_to_object(obj_player_space) <= 100 {
	if keyboard_check(vk_numpad1) && obj_player_space.BFL < 3 && obj_player_space.scrap >= 100
	{
		obj_player_space.BFL = 3
		effect_create_above(ef_spark, obj_player_space.x,obj_player_space.y, 0, c_blue);
		audio_play_sound(snd_shield_absorb, 2, false);
		obj_player_space.scrap -= 100;
		audio_play_sound(snd_scrap_spend, 2, false);
	}
}
