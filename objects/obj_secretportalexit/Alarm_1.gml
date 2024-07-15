obj_player.visible = true
obj_player.grav = 0.5
exited = false
if obj_player.sprite_index != spr_cotton_fall && obj_player.sprite_index != spr_cotton_idle && obj_player.sprite_index != spr_cotton_drill && obj_player.sprite_index != spr_cotton_drillup && obj_player.sprite_index != spr_cotton_attack
	obj_player.state = states.freefallprep
else
	obj_player.state = states.cottondrill