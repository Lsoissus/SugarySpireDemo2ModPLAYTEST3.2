if (exitsecret == true)
{
	if global.panic
	{
		global.panic = false
		global.secretpanic = true
	}
    obj_player.targetDoor = "SECRET"
    obj_player.targetRoom = targetsecret
	variable_global_set("secretfound" + string(secretid), true);
	instance_create(x, y, obj_fadeout);
}
else
{
	if global.secretpanic
	{
		global.panic = true
		global.secretpanic = false
	}
    obj_player.targetDoor = "SECRET"
    obj_player.targetRoom = global.lastroom
	instance_create(x, y, obj_fadeout);
}
