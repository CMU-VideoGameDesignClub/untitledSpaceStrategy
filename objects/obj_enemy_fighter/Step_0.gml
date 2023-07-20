move_wrap(true, true, 100);
var ex, ey;

if instance_exists(obj_player_space){
	ex = instance_nearest(x, y, obj_player_space).x;
	ey = instance_nearest(x, y, obj_player_space).y;
	
	if distance_to_object(obj_player_space) >= 150 {
		directionVar = point_direction(x, y, ex, ey);
			if direction >= directionVar {
				image_angle -= 4;
				direction -= 1;
			}
			if direction < directionVar {
				image_angle += 4;
				direction += 1;
			}
	}

	if image_angle >= direction {
		image_angle -= 4;
		if speed < 5 + random(5){
			motion_add(image_angle, .1);
		}
	}

	if image_angle < direction {
		image_angle += 4;
		if speed < 5 + random(5){
			motion_add(image_angle, .1);
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

	if distance_to_object(obj_player_space) >= 1000 {
		if speed > 0 {
			speed -= .25;
		}
	}
	if distance_to_object(obj_player_space) <= 70 {
		image_angle -= 7;
		direction -= 3;
		motion_add(image_angle, .1);
	}


	if distance_to_object(obj_player_space) <= 750 {

		if(shootCoolDown5 <= 0 && image_angle < point_direction(x, y, ex, ey) + 10 && image_angle > point_direction(x, y, ex, ey) - 10){	
			var ex, ey;
			ex = instance_nearest(x, y, obj_player_space).x;
			ey = instance_nearest(x, y, obj_player_space).y;

			with (instance_create_layer(x, y, "Instances", obj_fighter_blast)){
			    direction = point_direction(x, y, ex, ey);
				image_angle = direction;
			}
			shootCoolDown5 = (random(.5)*room_speed);
		}
			shootCoolDown5 -= (random(1)); 
	}
}

if instance_exists(obj_friendly_fighter){
	ex = instance_nearest(x, y, obj_friendly_fighter).x;
	ey = instance_nearest(x, y, obj_friendly_fighter).y;
	
	if distance_to_object(obj_friendly_fighter) >= 150 {
		directionVar = point_direction(x, y, ex, ey);
			if direction >= directionVar {
				image_angle -= 4;
				direction -= 1;
			}
			if direction < directionVar {
				image_angle += 4;
				direction += 1;
			}
	}

	if image_angle >= direction {
		image_angle -= 4;
		if speed < 5 + random(5){
			motion_add(image_angle, .1);
		}
	}

	if image_angle < direction {
		image_angle += 4;
		if speed < 5 + random(5){
			motion_add(image_angle, .1);
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

	if distance_to_object(obj_friendly_fighter) >= 1000 {
		if speed > 0 {
			speed -= .25;
		}
	}
	if distance_to_object(obj_friendly_fighter) <= 70 {
		image_angle -= 7;
		direction -= 3;
		motion_add(image_angle, .1);
	}


	if distance_to_object(obj_friendly_fighter) <= 750 {

		if(shootCoolDown5 <= 0 && image_angle < point_direction(x, y, ex, ey) + 10 && image_angle > point_direction(x, y, ex, ey) - 10){	
			var ex, ey;
			ex = instance_nearest(x, y, obj_friendly_fighter).x;
			ey = instance_nearest(x, y, obj_friendly_fighter).y;

			with (instance_create_layer(x, y, "Instances", obj_fighter_blast)){
			    direction = point_direction(x, y, ex, ey);
				image_angle = direction;
			}
			shootCoolDown5 = (random(.5)*room_speed);
		}
			shootCoolDown5 -= (random(1)); 
	}
}