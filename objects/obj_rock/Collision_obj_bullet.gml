instance_destroy(other);
audio_play_sound(snd_explosion1, 2, false);
effect_create_above(ef_explosion, x, y, 1, c_purple);
direction = random(360);

if sprite_index == spr_rock_big
{
        sprite_index = spr_rock_small;
        instance_copy(true);
}
else if instance_number(obj_rock) < 100
{
        sprite_index = spr_rock_big;
        x = -100;
}
else
{
        instance_destroy();
}

