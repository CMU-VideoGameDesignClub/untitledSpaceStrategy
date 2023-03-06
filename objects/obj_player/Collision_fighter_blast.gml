if(!shieldUp){
	effect_create_above(ef_explosion, x, y, 1, c_orange);
	audio_play_sound(Explosion1, 2, false);
	obj_game.alarm[0] = 100;
	instance_destroy(true);
}
else {
	effect_create_above(ef_ring, x, y, 0, c_aqua);
	audio_play_sound(shield_absorb, 2, false);
	instance_destroy(other);
}