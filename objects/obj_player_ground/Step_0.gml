var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space);
var onTheGround = place_meeting(x, y + 1, obj_block_brick);

if (xDirection != 0) image_xscale = xDirection;

xSpeed = xDirection * spd;
ySpeed++;

	var mouseX = mouse_x;
    var mouseY = mouse_y;
	direction = point_direction(obj_player_ground.x, obj_player_ground.y, mouseX, mouseY);
 

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
if mouse_check_button_pressed(mb_right) || instance_exists(obj_large_beam_charge || instance_exists(obj_enemy_large_beam)){
	if(BigBeamCooldown = -5.5){	
		audio_stop_sound(snd_large_beam)
		instance_destroy(obj_large_beam_charge)
		with (instance_create_layer(x, y, "Instances", obj_enemy_large_beam)){
			audio_stop_sound(snd_large_beam_charge)
		    direction = point_direction(obj_player_ground.x, obj_player_ground.y, mouseX, mouseY)
			image_angle = direction;
		}
		BigBeamCooldown = (.06*room_speed);
	}
		BigBeamCooldown -= .01;
		
	if(BigBeamCooldown = -.5){
		audio_stop_sound(snd_large_beam_charge)
		instance_destroy(obj_enemy_large_beam)
		with (instance_create_layer(x, y, "Instances", obj_large_beam_charge)){
			audio_stop_sound(snd_large_beam)
		    direction = point_direction(obj_player_ground.x, obj_player_ground.y, mouseX, mouseY)
			image_angle = direction;
		}
	}
}

