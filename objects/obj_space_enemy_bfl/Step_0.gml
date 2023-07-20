move_wrap(true, true, 100);
var ex, ey;

// checks distance from player before attacking
if distance_to_object(obj_player_space) <= 3500 {

	if(BigBeamCooldown = -5.5){	
		audio_stop_sound(snd_large_beam)
		instance_destroy(obj_large_beam_charge)
		with (instance_create_layer(x, y, "Instances", obj_enemy_large_beam)){
			audio_stop_sound(snd_large_beam_charge)
		    direction = obj_space_enemy_bfl.image_angle;
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
		    direction = obj_space_enemy_bfl.image_angle;
			image_angle = direction;
		}
	}
}

if distance_to_object(obj_player_space) > 10 {
	ex = instance_nearest(x, y, obj_player_space).x;
	ey = instance_nearest(x, y, obj_player_space).y;
		if image_angle >= point_direction(obj_space_enemy_bfl.x, obj_space_enemy_bfl.y, ex, ey){
			obj_space_enemy_bfl.image_angle -= .5
			obj_space_enemy_bfl.direction -= .5;
		}
		if image_angle < point_direction(obj_space_enemy_bfl.x, obj_space_enemy_bfl.y, ex, ey){
			obj_space_enemy_bfl.image_angle += .5
			obj_space_enemy_bfl.direction += .5;
		}
}

	if image_angle <= direction + 45 && image_angle >= direction - 45 {
		if speed < 15 + random(5){
			motion_add(image_angle, .1);
		}
	}

	if image_angle >= direction + 45 || image_angle <= direction - 45 {
		if speed > -0 {
			speed -= .25;
		}
	}