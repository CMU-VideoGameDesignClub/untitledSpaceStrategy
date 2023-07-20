if keyboard_check_pressed(vk_insert)
{
	audio_stop_all()
	audio_play_sound(snd_secret_track, 2, true)
}
if keyboard_check_pressed(vk_escape)
{
	game_end()
}
if keyboard_check(vk_backspace)
{
	room_goto(rm_space_map)
	audio_stop_all()
	audio_play_sound(snd_secret_track, 2, true)
}