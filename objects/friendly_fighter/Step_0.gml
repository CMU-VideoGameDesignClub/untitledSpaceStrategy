move_wrap(true, true, 100);
var ex, ey;
speed += .1

if instance_exists(enemy_fighter){
	ex = instance_nearest(x, y, enemy_fighter).x;
	ey = instance_nearest(x, y, enemy_fighter).y;

	if distance_to_object(enemy_fighter) >= 150 {
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

if distance_to_object(enemy_fighter) >= 1000 {
	if speed > 0 {
		speed -= .25;
	}
}
if distance_to_object(enemy_fighter) <= 70 {
	image_angle -= 7;
	direction -= 3;
	motion_add(image_angle, .1);
}


if distance_to_object(enemy_fighter) <= 750 {

	if(shootCoolDown5 <= 0 && image_angle < point_direction(x, y, ex, ey) + 10 && image_angle > point_direction(x, y, ex, ey) - 10){	
		var ex, ey;
		ex = instance_nearest(x, y, enemy_fighter).x;
		ey = instance_nearest(x, y, enemy_fighter).y;

		with (instance_create_layer(x, y, "Instances", obj_bullet)){
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown5 = (random(.5)*room_speed);
	}
		shootCoolDown5 -= (random(1)); 
}

if instance_exists(space_enemy_bfl){
	ex = instance_nearest(x, y, space_enemy_bfl).x;
	ey = instance_nearest(x, y, space_enemy_bfl).y;

	if distance_to_object(space_enemy_bfl) >= 150 {
		directionVar = point_direction(x, y, ex, ey);
			if direction >= directionVar {
				image_angle -= 4;
				direction -= 1;
				speed += .1
			}
			if direction < directionVar {
				image_angle += 4;
				direction += 1;
				speed += .1
			}
	}

	if image_angle >= direction {
		image_angle -= 4;
		if speed < 5 + random(5){
			motion_add(image_angle, .1);
			speed += .1
		}
	}

	if image_angle < direction {
		image_angle += 4;
		if speed < 5 + random(5){
			motion_add(image_angle, .1);
			speed += .1
		}
	}
if image_angle <= direction + 45 && image_angle >= direction - 45 {
	if speed < 15 + random(5){
		motion_add(image_angle, .1);
		speed += .1
	}
}

if image_angle >= direction + 45 || image_angle <= direction - 45 {
	if speed > 7 {
		speed -= .25;
	}
	if speed < 5 {
		speed += .25;
	}
}

if distance_to_object(space_enemy_bfl) >= 1000 {
	turnDecision = irandom_range(1,2)
	if speed > 0 {
		speed -= .25;
	}
}
if distance_to_object(space_enemy_bfl) <= 150 {
	if turnDecision == 1{
		image_angle -= 7;
		direction -= 3;
	}
	if turnDecision == 2{
		image_angle += 7;
		direction += 3;
	}

	motion_add(image_angle, .1);
	speed += .1
}


if distance_to_object(space_enemy_bfl) <= 750 {

	if(shootCoolDown5 <= 0 && image_angle < point_direction(x, y, ex, ey) + 10 && image_angle > point_direction(x, y, ex, ey) - 10){	
		var ex, ey;
		ex = instance_nearest(x, y, space_enemy_bfl).x;
		ey = instance_nearest(x, y, space_enemy_bfl).y;

		with (instance_create_layer(x, y, "Instances", obj_bullet)){
		    direction = point_direction(x, y, ex, ey);
			image_angle = direction;
		}
		shootCoolDown5 = (random(.5)*room_speed);
	}
		shootCoolDown5 -= (random(1)); 
}	
	
}

