if instance_exists(space_enemy_bfl){		    
			direction = space_enemy_bfl.image_angle;
			image_angle = direction;
			obj_enemy_large_beam.x = space_enemy_bfl.x
			obj_enemy_large_beam.y = space_enemy_bfl.y
}

if instance_exists(obj_player_ground){		    
			direction = obj_player_ground.image_angle;
			image_angle = direction;
			obj_enemy_large_beam.x = obj_player_ground.x
			obj_enemy_large_beam.y = obj_player_ground.y
}