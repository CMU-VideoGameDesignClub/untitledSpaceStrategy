if keyboard_check_pressed(vk_insert)
{
	audio_stop_all()
	audio_play_sound(secret_track, 2, true)
}
if keyboard_check_pressed(vk_escape)
{
	game_end()
}