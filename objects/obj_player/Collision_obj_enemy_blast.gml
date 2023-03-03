effect_create_above(ef_firework, x, y, 1, c_orange);
audio_play_sound(Explosion1, 2, false);
obj_game.alarm[0] = 100;
instance_destroy();