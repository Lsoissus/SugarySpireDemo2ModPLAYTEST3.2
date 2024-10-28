function scr_player_handstandjump()
{
	switch (character)
	{
		case "P":
			if movespeed < 10
				movespeed = 10;
			move = key_left + key_right;
			landAnim = false;
			mach2 = 35;
			hsp = xscale * movespeed;
			grav = 0;
			momemtum = true;
			dir = xscale;
			if (image_index > 7)
				grav = 0.5;
			if (move != xscale && move != 0)
			{
				state = states.jump;
				image_index = 0;
				sprite_index = spr_player_suplexdashCancel;
				jumpAnim = true;
				momemtum = false;
				mach2 = 0;
				xscale *= -1;
				if (audio_is_playing(sound_suplex1))
					audio_stop_sound(sound_suplex1);
			}
			if (animation_end())
			{
				state = states.normal;
				grav = 0.5;
				flash = false;
			}
			if (key_down)
			{
				if (grounded)
				{
					crouchslipbuffer = 25;
					grav = 0.5;
					sprite_index = spr_crouchslip;
					machhitAnim = false;
					state = states.machroll;
					if (audio_is_playing(sound_suplex1))
						audio_stop_sound(sound_suplex1);
					movespeed = 12;
				}
				/*else
				{
					grav = 0.5;
					image_index = 1;
					state = states.freefallprep;
					sprite_index = spr_player_bodyslamstart;
					vsp = -5;
				}*/
			}
			if (key_jump && grounded)
			{
				sprite_index = spr_mach2jump;
				instance_create(x, y, obj_jumpdust);
				state = states.mach2;
				vsp = -11;
				if (audio_is_playing(sound_suplex1))
					audio_stop_sound(sound_suplex1);
			}
			if ((!grounded && scr_solid(x + hsp, y, true) && !place_meeting(x + hsp, y, obj_destructibles) && !scr_slope_ext(x + sign(hsp), y)) || (grounded && (scr_solid(x + sign(hsp), y - 2, true) && !scr_slope_ext(x + sign(hsp), y - 1)) && !place_meeting(x + hsp, y, obj_destructibles) && scr_slope()))
			{
				wallspeed = 6;
				grabclimbbuffer = 10;
				state = states.climbwall;
			}
			else if (grounded && scr_solid(x + sign(hsp), y) && (!scr_slope() && scr_solid(x + sign(hsp), y - 2)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
			{
				grav = 0.5;
				movespeed = 0;
				state = states.bump;
				hsp = -2.5 * xscale;
				vsp = -3;
				mach2 = 0;
				image_index = 0;
				machslideAnim = true;
				machhitAnim = false;
				instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
				if (audio_is_playing(sound_suplex1))
					audio_stop_sound(sound_suplex1);
				scr_sound(sound_bump);
			}
			image_speed = 0.3;
			if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
				instance_create(x, y, obj_slidecloud);
			break;
	}
	if (key_attack && animation_end() && sprite_index != spr_player_bump)
	{
		grav = 0.5;
		state = states.mach2;
		sprite_index = spr_mach;
	}
	if (!global.starrmode)
	{
		if (key_slap2 && !key_down)
		{
			sprite_index = spr_player_machtumble;
			image_index = 0;
			image_speed = 0.2;
			state = states.machtumble;
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
		}
	}
}
