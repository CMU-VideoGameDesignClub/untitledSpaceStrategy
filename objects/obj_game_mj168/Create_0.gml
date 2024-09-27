distanceFromFighter = 0;
ex = 0;
ey = 0;

displayX = 1920;
displayY = 1080;
window_set_fullscreen(true);

view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;

view_wport[0] = displayX
view_hport[0] = displayY
	
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player_space, -1, -1, displayX, displayY);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 700;
var _ypos = (_dheight / 2) - 500;
window_set_rectangle(_xpos, _ypos, displayX, displayY);

surface_resize(application_surface, displayX, displayY);

// Initialize variables for formation movement
formationJiggleSpeed = 0.2; // Speed of the subtle jiggle
formationJiggleAmplitude = 5; // How much the aliens jiggle in place

formationMoveSpeed = 16; // Speed of the left-to-right movement (slow)
formationMoveAmplitude = 300; // Distance the entire formation moves left and right

global.formationOffset = 0; // Initial jiggle offset
global.formationMoveOffset = 0; // Initial left-right movement offset

