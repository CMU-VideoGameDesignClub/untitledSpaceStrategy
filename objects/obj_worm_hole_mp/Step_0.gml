image_angle +=.35;
if distance_to_object(obj_player_space) <= 50 {
	if keyboard_check(vk_enter)
	{
	 room_goto(rm_client)
	}
		if keyboard_check(vk_control)
	{
	 room_goto(rm_server)
	}
}
