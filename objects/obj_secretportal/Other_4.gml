if (obj_player.targetDoor == "SECRET" && exitsecret == true)
{
    exitedsecret = 1
	obj_player.x = x
	obj_player.y = y - 35
	obj_player.hsp = 0
	obj_player.vsp = 0
	obj_player.grav = 0
	if obj_player.sprite_index != spr_cotton_fall && obj_player.sprite_index != spr_cotton_idle && obj_player.sprite_index != spr_cotton_drill && obj_player.sprite_index != spr_cotton_drill && obj_player.sprite_index != spr_cotton_attack
		obj_player.sprite_index = spr_player_bodyslamfall
    die = true
	scr_sound(sfx_secretexit)
	alarm[2] = 2
}
if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()