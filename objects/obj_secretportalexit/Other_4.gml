if (obj_player.targetDoor == "SECRET")
{
	obj_player.x = x
	obj_player.y = y
	obj_player.grav = 0
	obj_player.sprite_index = spr_player_pound
    alarm[0] = 15
	scr_sound(sfx_secretexit)
}
else
	exited = false
