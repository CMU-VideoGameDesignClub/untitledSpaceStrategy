move_wrap(true, true, 0)
shieldUp = true;


// Need to initialize variables here too
displayX = 1600;
displayY = 900;

if keyboard_check(vk_up)
{
	 motion_add(image_angle, .1);
}
if keyboard_check(vk_down)
{
	if(obj_player.speed > 0){
		obj_player.speed -= .25;
	}
}
if keyboard_check(vk_left)
{
	 image_angle += 4;
}
if keyboard_check(vk_right)
{
	 image_angle -= 4;
}

if keyboard_check_pressed(vk_space)
{
	instance_create_layer(x-10, y-10, "Instances", obj_bullet)	
	instance_create_layer(x+10, y+10, "Instances", obj_bullet)	
}

camera_set_view_size(view_camera[0], displayX + (obj_player.speed*obj_player.speed)*1.6, displayY + (obj_player.speed*obj_player.speed)*.9);
