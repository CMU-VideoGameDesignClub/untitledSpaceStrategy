/// @description Insert description here
// You can write your code in this editor
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
	 image_angle +=4;
}
if keyboard_check(vk_right)
{
	 image_angle -=4;
}


move_wrap(true, true, 0)

if keyboard_check_pressed(vk_space)
{
	instance_create_layer(x-15, y+15, "Instances", obj_bullet)	
	instance_create_layer(x+15, y-15, "Instances", obj_bullet)	
}

camera_set_view_size(view_camera[0], 1366 + (obj_player.speed*obj_player.speed)*1.6, 768 + (obj_player.speed*obj_player.speed)*.9);
