if distance_to_object(obj_player_space) <= 100 {
	if keyboard_check(vk_enter)
	{
		room_goto(rm_planet_ground_y)
		audio_stop_all()
		audio_play_sound(snd_backgroundbitmmusic, 2, true);
	}
}

if instance_exists(obj_enemy_fighter){
	// friendly spawn
	if(friendlySpawn1 <= 0){	
		with (instance_create_layer(x, y, "Instances", obj_friendly_fighter)){
			direction = point_direction(x, y, obj_enemy_fighter.x, obj_enemy_fighter.y);
			image_angle = direction;
			speed = 5
		}
		friendlySpawn1 = (1*room_speed);
	}
		friendlySpawn1 -= .5;
}

if instance_exists(obj_space_enemy_bfl){
	// friendly spawn
	if(friendlySpawn1 <= 0){	
		with (instance_create_layer(x, y, "Instances", obj_friendly_fighter)){
			direction = point_direction(x, y, obj_space_enemy_bfl.x, obj_space_enemy_bfl.y);
			image_angle = direction;
			speed = 5
		}
		friendlySpawn1 = (1*room_speed);
	}
		friendlySpawn1 -= .5;
}