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