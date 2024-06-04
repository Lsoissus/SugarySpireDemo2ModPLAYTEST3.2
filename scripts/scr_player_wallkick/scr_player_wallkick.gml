function scr_player_wallkick(){
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_wallkick)
	{
		sprite_index = spr_player_wallkickloop
		scr_sound(sfx_flip)
	}
	if (key_slap2 && sprite_index == spr_player_wallkickloop)
	{
			instance_create(x, y, obj_jumpdust);
			sprite_index = spr_player_mach3;
			state = states.mach3
			vsp = -9
			audio_stop_sound(sfx_flip)
			movespeed += 2
	}
	if (grounded && sprite_index == spr_player_wallkickloop)
	{
			instance_create(x, y, obj_jumpdust);
			audio_stop_sound(sfx_flip)
			sprite_index = spr_player_mach3;
			state = states.mach3
			movespeed += 2
	}
}