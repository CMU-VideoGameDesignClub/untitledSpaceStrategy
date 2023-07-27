draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if active = true
{
	draw_set_color(c_lime);
	draw_text(100,400, "> "+chat_text);
}
else
{
	draw_set_color(c_grey);
	draw_text(100,400, "> ");
}