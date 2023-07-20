playerHP--;
	if playerHP == 0 {
		obj_game.alarm[0] = 100;
		effect_create_above(ef_explosion, x, y, 1, c_orange);
		audio_play_sound(snd_explosion1, 2, false);
		instance_create_layer(0, 0, "Instances", obj_player_defeat_transition);
	}