move_wrap(true, true, 100);
image_angle +=.35;

// checks distance from player before attacking
if distance_to_object(obj_player_space) <= 500 {

	// first turret
	if(shootCoolDown1 <= 0){	
		var ex, ey;
		ex = instance_nearest(x, y, obj_player_space).x;
		ey = instance_nearest(x, y, obj_player_space).y;

		with (instance_create_layer(x+75, y+75, "Instances", obj_enemy_blast)){
			speed = 10 + random(15);
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown1 = (0.25*room_speed);
	}
		shootCoolDown1 -= .5 + random(1);
 
	// second turret
	if(shootCoolDown2 <= 0){	
		var ex, ey;
		ex = instance_nearest(x, y, obj_player_space).x;
		ey = instance_nearest(x, y, obj_player_space).y;

		with (instance_create_layer(x+75, y-75, "Instances", obj_enemy_blast)){
			speed = 10 + random(15);
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown2 = (0.25*room_speed);
	}
		shootCoolDown2 -= .5 + random(1);
	
	// third turret
	if(shootCoolDown3 <= 0){	
		var ex, ey;
		ex = instance_nearest(x, y, obj_player_space).x;
		ey = instance_nearest(x, y, obj_player_space).y;

		with (instance_create_layer(x-75, y+75, "Instances", obj_enemy_blast)){
			speed = 10 + random(15);
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown3 = (0.25*room_speed);
	}
		shootCoolDown3 -= .5 + random(1);

	// fourth turret
	if(shootCoolDown4 <= 0){	
		var ex, ey;
		ex = instance_nearest(x, y, obj_player_space).x;
		ey = instance_nearest(x, y, obj_player_space).y;

		with (instance_create_layer(x-75, y-75, "Instances", obj_enemy_blast)){
			speed = 10 + random(15);
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown4 = (0.25*room_speed);
	}
		shootCoolDown4 -= .5 + random(1);
}

	// enemy hanger
if(enemyHangerSpawn1 <= 0){	
	//var ex, ey;
	//ex = instance_nearest(x, y, obj_player_space).x;
	//ey = instance_nearest(x, y, obj_player_space).y;

	with (instance_create_layer(x, y, "Instances", enemy_fighter)){
	//direction = point_direction(x, y, ex, ey);
	image_angle = direction;
	speed = 5
	}
	enemyHangerSpawn1 = (1*room_speed);
}
	enemyHangerSpawn1 -= .2;

if distance_to_object(friendly_fighter) <= 500 {

	// first turret
	if(shootCoolDown1 <= 0){	
		var ex, ey;
		ex = instance_nearest(x, y, friendly_fighter).x;
		ey = instance_nearest(x, y, friendly_fighter).y;

		with (instance_create_layer(x+75, y+75, "Instances", obj_enemy_blast)){
			speed = 10 + random(15);
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown1 = (0.25*room_speed);
	}
		shootCoolDown1 -= .5 + random(1);
 
	// second turret
	if(shootCoolDown2 <= 0){	
		var ex, ey;
		ex = instance_nearest(x, y, friendly_fighter).x;
		ey = instance_nearest(x, y, friendly_fighter).y;

		with (instance_create_layer(x+75, y-75, "Instances", obj_enemy_blast)){
			speed = 10 + random(15);
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown2 = (0.25*room_speed);
	}
		shootCoolDown2 -= .5 + random(1);
	
	// third turret
	if(shootCoolDown3 <= 0){	
		var ex, ey;
		ex = instance_nearest(x, y, friendly_fighter).x;
		ey = instance_nearest(x, y, friendly_fighter).y;

		with (instance_create_layer(x-75, y+75, "Instances", obj_enemy_blast)){
			speed = 10 + random(15);
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown3 = (0.25*room_speed);
	}
		shootCoolDown3 -= .5 + random(1);

	// fourth turret
	if(shootCoolDown4 <= 0){	
		var ex, ey;
		ex = instance_nearest(x, y, friendly_fighter).x;
		ey = instance_nearest(x, y, friendly_fighter).y;

		with (instance_create_layer(x-75, y-75, "Instances", obj_enemy_blast)){
			speed = 10 + random(15);
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown4 = (0.25*room_speed);
	}
		shootCoolDown4 -= .5 + random(1);
}