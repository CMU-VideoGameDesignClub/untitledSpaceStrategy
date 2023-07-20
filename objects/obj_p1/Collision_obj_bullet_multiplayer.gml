if (other.player == self) exit;

effect_create_above(ef_explosion, x, y, 0, c_white);
audio_play_sound(snd_explosion1, 2, false);
        
x = irandom_range(40, room_width - 40);

y = irandom_range(40, room_height - 40);
        
instance_destroy(other);
other.player.points ++;