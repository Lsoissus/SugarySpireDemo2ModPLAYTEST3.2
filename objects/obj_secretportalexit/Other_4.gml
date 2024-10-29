if (obj_player.targetDoor == "SECRET")
{
	obj_player.x = x
	obj_player.y = y
	obj_player.grav = 0
	if obj_player.sprite_index != spr_cotton_fall && obj_player.sprite_index != spr_cotton_idle && obj_player.sprite_index != spr_cotton_drill && obj_player.sprite_index != spr_cotton_drill && obj_player.sprite_index != spr_cotton_attack
		obj_player.sprite_index = spr_player_bodyslamstart
    alarm[0] = 15
	scr_sound(sfx_secretexit)
}
else
	exited = false
