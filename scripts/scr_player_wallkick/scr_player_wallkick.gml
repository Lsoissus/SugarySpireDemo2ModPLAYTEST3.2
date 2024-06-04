function scr_player_wallkick(){
	move = key_right + key_left;
	hsp = move * movespeed;
	if move != 0
		movespeed += 1;
	else
		movespeed -= 0.5;
	if movespeed > 8
		movespeed = 8;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_wallkick)
	{
		sprite_index = spr_player_wallkickloop
		scr_sound(sfx_flip)
	}
	if sprite_index == spr_player_wallkickloop {
		if (key_slap2 || key_attack2)
		{
			if move != 0
				xscale = move;
			instance_create(x, y, obj_jumpdust);
			sprite_index = spr_player_mach3;
			state = states.mach3
			vsp = -11
			audio_stop_sound(sfx_flip)
			movespeed = 12;
			mach2 = 100;
		}
		if (grounded && vsp >= 0)
		{
			if key_attack {
				if move != 0
					xscale = move;
				instance_create(x, y, obj_jumpdust);
				audio_stop_sound(sfx_flip)
				sprite_index = spr_player_mach3;
				state = states.mach3
				movespeed = 12;
				mach2 = 100;
			}
			else {
				state = states.normal;
				movespeed = 0;
				mach2 = 0;
			}
		}
	}
}