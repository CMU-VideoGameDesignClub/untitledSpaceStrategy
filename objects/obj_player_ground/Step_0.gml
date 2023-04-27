var xDirection = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_space);
var onTheGround = place_meeting(x, y + 1, obj_block_brick);

if (xDirection != 0) image_xscale = xDirection;

xSpeed = xDirection * spd;
ySpeed++;

 

if(place_meeting(x+xSpeed, y, obj_block_brick)){
	xSpeed = 0;
}
if(place_meeting(x, y+ySpeed, obj_block_brick)){
	ySpeed = 0;
}

if(jump) {
	ySpeed = -15;
}

x+= xSpeed;
y+= ySpeed;

if mouse_check_button_pressed(mb_left) {
	
	var mouseX = mouse_x;
    var mouseY = mouse_y;

	
	with (instance_create_layer(obj_player_ground.x, obj_player_ground.y, "Instances", obj_bullet)){
		direction = point_direction(obj_player_ground.x, obj_player_ground.y, mouseX, mouseY);
		image_angle = direction;
	}
}
