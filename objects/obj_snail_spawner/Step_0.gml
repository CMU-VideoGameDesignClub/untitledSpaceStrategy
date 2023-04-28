if(snail_spawner<= 0){	
	//var ex, ey;
	//ex = instance_nearest(x, y, obj_player_space).x;
	//ey = instance_nearest(x, y, obj_player_space).y;

	with (instance_create_layer(x+irandom_range(-100,100), y+irandom_range(-100,100), "Instances", obj_death_snail)){
	//direction = point_direction(x, y, ex, ey);
	image_angle = direction;
	speed = 5
	}
	snail_spawner = (1*room_speed);
}
	snail_spawner -= 2