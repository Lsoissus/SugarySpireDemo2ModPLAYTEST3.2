if (!instance_exists(ID) || (obj_player.state == states.mach3 || obj_player.state == states.pizzanokungfu || obj_player.state == states.kungfuCookie || obj_player.state == states.rocketfistpizzano || obj_player.state == states.minecart))
	exit;
event_inherited();