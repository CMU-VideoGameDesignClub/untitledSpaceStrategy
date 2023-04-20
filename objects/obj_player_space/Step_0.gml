move_wrap(true, true, 0)


// Need to initialize variables here too
displayX = 1920;
displayY = 1080;

if keyboard_check(vk_up)
{
	 motion_add(image_angle, .1)
}
if keyboard_check(vk_down)
{
	if(obj_player_space.speed > 0){
		obj_player_space.speed -= .35;
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

if keyboard_check_pressed(vk_space){
	with (instance_create_layer(x-10, y-10, "Instances", obj_bullet)){
		direction = obj_player_space.image_angle;
		image_angle = direction;
	}
	with (instance_create_layer(x+10, y+10, "Instances", obj_bullet)){
		direction = obj_player_space.image_angle;
		image_angle = direction;
	}
}





camera_set_view_size(view_camera[0], displayX + (obj_player_space.speed*obj_player_space.speed)*1.6, displayY + (obj_player_space.speed*obj_player_space.speed)*.9);
