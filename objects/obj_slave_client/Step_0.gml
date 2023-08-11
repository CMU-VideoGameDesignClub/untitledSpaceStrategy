move_wrap(true, true, 0)

if shield
{
	with (instance_create_layer(x, y, "Instances", obj_shield)){
		obj_shield.x = x;
		obj_shield.y = y;
	}
}
if shield == false
{
	if instance_exists(obj_shield)
	{
		instance_destroy(obj_shield)
	}
}