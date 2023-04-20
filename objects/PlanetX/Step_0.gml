if distance_to_object(obj_player_space) <= 100 {
	if keyboard_check(vk_enter)
	{
		room_goto(planetGround)
		audio_stop_all()
		audio_play_sound(backgroundbitmmusic, 2, true);
	}
}

if instance_exists(enemy_fighter){
	// friendly spawn
	if(friendlySpawn1 <= 0){	
		with (instance_create_layer(x, y, "Instances", friendly_fighter)){
			direction = point_direction(x, y, enemy_fighter.x, enemy_fighter.y);
			image_angle = direction;
			speed = 5
		}
		friendlySpawn1 = (1*room_speed);
	}
		friendlySpawn1 -= .5;
}

if instance_exists(space_enemy_bfl){
	// friendly spawn
	if(friendlySpawn1 <= 0){	
		with (instance_create_layer(x, y, "Instances", friendly_fighter)){
			direction = point_direction(x, y, space_enemy_bfl.x, space_enemy_bfl.y);
			image_angle = direction;
			speed = 5
		}
		friendlySpawn1 = (1*room_speed);
	}
		friendlySpawn1 -= .5;
}