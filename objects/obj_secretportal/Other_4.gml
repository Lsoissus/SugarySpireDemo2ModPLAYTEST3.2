if (obj_player.targetDoor == "SECRET" && exitsecret == true)
{
    exitedsecret = 1
	obj_player.x = x
	obj_player.y = y
	obj_player.grav = 0
    visible = false
    alarm[2] = 15
}
if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
