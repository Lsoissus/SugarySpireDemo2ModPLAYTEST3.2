function scr_player_crouchslide()
{
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
		hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (xscale * movespeed) + 5;
	mask_index = spr_crouchmask;
	if key_jump2
	{
		state = states.mach2;
		vsp = -9
		sprite_index = spr_player_longjump
	}

				if (!key_down && grounded)
				{
					alarm[0] = 240;
					scr_sound(sound_break);
					sprite_index = spr_machslidestart;
					state = states.machslide;
					image_index = 0;
					mach2 = 0;
				}
	if (key_attack2 && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	{
		switch (character)
		{
			default:
				sprite_index = spr_player_rollgetup;
				image_index = 0;
				mach2 = 35;
				state = states.mach3;
				if (movespeed < 10)
					movespeed = 10;
				break;
			case "N":
				sprite_index = spr_pizzano_mach2;
				image_index = 0;
				state = states.machpizzano;
				break;
		}
	}
	if (movespeed <= 0 && (!scr_slope() || scr_solid(x + xscale, y, true)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		state = states.normal;
		movespeed = 0;
		mach2 = 0;
		crouchslideAnim = true;
		image_index = 0;
		crouchAnim = true;
		start_running = true;
		alarm[4] = 14;
	}
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		movespeed = 0;
		state = states.bump;
		hsp = xscale * -2.5;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		machslideAnim = true;
		machhitAnim = false;
		instance_create(x + (xscale * 10), y + (xscale * 10), obj_bumpeffect);
	}
			if (key_down && !place_meeting(x, y, obj_dashpad) && !grounded && sprite_index != spr_player_dive)
			{
				flash = false;
				state = states.machroll;
				vsp = 15;
			}
	var _xscale = xscale;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
		instance_create(x, y, obj_slidecloud);
	image_speed = 0.35;
}
