if (stopentersecret == 0 && exitedsecret == 0)
{
    stopentersecret = 1;
    if (exitsecret == true)
        global.lastroom = room;
	obj_player.state = states.actor;
	if obj_player.state != states.cotton && obj_player.state != states.cottondrill && obj_player.state != states.cottonroll
		obj_player.sprite_index = spr_player_stun;
	obj_player.x = x;
	obj_player.y = y;
	obj_player.grav = 0;
	entered = true;
	obj_player.movespeed = 0;
	sprite_index = spr_secretportal_enter;
	image_index = 0;
	scr_sound(sfx_secretenter);
}