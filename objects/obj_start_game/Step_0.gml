if keyboard_check(vk_enter)
{
	 room_goto(rm_hub_system)
}
if keyboard_check_pressed(vk_control)
{
	room_goto(rm_server)
}
if keyboard_check_pressed(vk_escape)
{
	game_end()
}
if keyboard_check_pressed(vk_alt)
{
	room_goto(rm_server_ground)
}