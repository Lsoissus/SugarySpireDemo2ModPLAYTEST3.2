if (exitsecret == true)
{
	if global.panic
	{
		global.panic = false
		global.secretpanic = true
	}
    obj_player.targetDoor = "SECRET"
    room_goto(targetsecret)
}
else
{
	if global.secretpanic
	{
		global.panic = true
		global.secretpanic = false
	}
    obj_player.targetDoor = "SECRET"
    room_goto(global.lastroom)
}
