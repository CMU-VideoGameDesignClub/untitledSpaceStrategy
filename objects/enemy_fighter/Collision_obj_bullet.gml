effect_create_above(ef_explosion, x, y, 1, c_orange);
audio_play_sound(Explosion1, 2, false);
instance_destroy();
instance_destroy(other);


obj_player_space.scrap += 25
audio_play_sound(snd_scrap, 2, false);
