if room == rm_mj168 || rm_start_screen2 
{
	exit;
}

if distance_to_object(obj_player_space) <= 100 
{
	draw_text(10, 50, "Press Enter to land on planet.");
}