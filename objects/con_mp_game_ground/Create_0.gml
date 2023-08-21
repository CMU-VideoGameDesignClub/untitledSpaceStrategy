username = get_string("Please enter a username","")
window_set_fullscreen(false)
window_set_size(1366,768)
ex = 0;
ey = 0;

displayX = 1920;
displayY = 1080;
//window_set_fullscreen(true);

view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;

view_wport[0] = displayX
view_hport[0] = displayY
	
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player_client_ground, -1, -1, displayX, displayY);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 700;
var _ypos = (_dheight / 2) - 500;
window_set_rectangle(_xpos, _ypos, displayX, displayY);

surface_resize(application_surface, displayX, displayY);
