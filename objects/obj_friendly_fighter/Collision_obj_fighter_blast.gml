effect_create_above(ef_explosion, x, y, 1, c_orange);
audio_play_sound(snd_explosion1, 2, false);
instance_destroy();
instance_destroy(other);