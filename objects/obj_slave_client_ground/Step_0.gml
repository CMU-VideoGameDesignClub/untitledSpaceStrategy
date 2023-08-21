move_wrap(true, true, 0)

if shield
{
	with (instance_create_layer(x, y, "Instances", obj_shield)){
		obj_shield.x = x;
		obj_shield.y = y;
	}
}
if shield = true
{
	with (instance_create_layer(x, y, "Instances", obj_shield)){
		obj_shield.x = x;
		obj_shield.y = y;
		
		if obj_slave_client_ground.damaged == true
		{
			instance_destroy(obj_shield)
			shield = false
		}
	}
}