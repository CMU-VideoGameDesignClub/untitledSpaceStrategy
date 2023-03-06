var _input = rollback_get_input();

// Need to initialize variables here too

if keyboard_check(vk_up)
{
	 motion_add(image_angle, .1);
}
if keyboard_check(vk_down)
{
	if(obj_p1.speed > 0){
		obj_p1.speed -= .25;
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
		var _proj = instance_create_layer(x, y, layer, obj_bullet_multiplayer);
        
        _proj.speed = 10;
        _proj.direction = image_angle;
        _proj.image_angle = image_angle;
        _proj.player = self;
	//instance_create_layer(x, y, "Instances", obj_bullet_multiplayer)		
}

