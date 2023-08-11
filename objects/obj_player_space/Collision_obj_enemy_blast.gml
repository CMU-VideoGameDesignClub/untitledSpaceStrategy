if(shieldUp<=0){
	playerHP--;
	instance_destroy();
	if playerHP == 0 {
		obj_game.alarm[0] = 100;
		effect_create_above(ef_explosion, x, y, 1, c_orange);
		audio_play_sound(snd_explosion1, 2, false);
		instance_create_layer(0, 0, "Instances", obj_player_defeat_transition);
	}
}
else {
	effect_create_above(ef_ring, x, y, 0, c_aqua);
	audio_play_sound(snd_shield_absorb, 2, false);
	shieldUp--;
	instance_destroy(other);
}