if distance_to_object(obj_player_space) <= 100 {
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text_ext_transformed(cx,cy, "Press Enter to land on Testing Grounds", 10, 400, 1, 1, image_angle);
}