if (obj_player.targetDoor == "SECRET" && exitsecret == true)
{
    exitedsecret = 1
	obj_player.x = x
	obj_player.y = y
	obj_player.grav = 0
    die = true
	scr_sound(sfx_secretexit)
	alarm[2] = 20
}
if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
