if distance_to_object(obj_player_space) <= 100 {
	if keyboard_check(vk_enter) && obj_player_space.shieldUp < 3
	{
		obj_player_space.shieldUp = 3
		effect_create_above(ef_ring, obj_player_space.x,obj_player_space.y, 0, c_aqua);
		audio_play_sound(shield_absorb, 2, false);
	}
}
