if (obj_player.state == states.cotton || obj_player.state == states.cottondrill || obj_player.state == states.cottonroll)
	{
		obj_player.state = states.mach3
		obj_player.sprite_index = spr_player_mach3
		obj_player.movespeed = 13
	}