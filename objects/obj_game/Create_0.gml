points = 0;

view_enabled = true;
view_visibile[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1366;
view_hport[0] = 768;

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player, -1, -1, 1366, 768);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 480;
var _ypos = (_dheight / 2) - 270;
window_set_rectangle(_xpos, _ypos, 1366, 768);

surface_resize(application_surface, 1366, 768);