if (exitsecret == true)
{
    obj_player.targetDoor = "SECRET"
    obj_player.targetRoom = targetsecret
	variable_global_set("secretfound" + string(secretid), true);
	instance_create(x, y, obj_fadeout);
}
else
{
    obj_player.targetDoor = "SECRET"
    obj_player.targetRoom = global.lastroom
	instance_create(x, y, obj_fadeout);
}
