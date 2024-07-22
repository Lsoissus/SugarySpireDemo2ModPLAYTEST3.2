function scr_player_handstandjump()
{
	switch (character)
	{
		default:
			move = key_left + key_right;
			landAnim = false;
			if mach2 <= 35
				mach2 = 35;
			hsp = xscale * movespeed;
			grav = (character == characters.pizzano ? 0.5 : 0);
			momemtum = true;
			dir = xscale;
			if movespeed <= 12
				movespeed = 12
			if (sprite_index == spr_player_suplexdash && !instance_exists(obj_crazyrunothereffect))
				instance_create(x, y, obj_crazyrunothereffect);
			if (image_index > 7)
				movespeed -= 1;
			if move != xscale && move != 0
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
			if (floor(image_index) == (image_number - 1))
			{
				state = states.normal;
				grav = 0.5;
				flash = false;
			}
			if (key_down)
			{
				if (grounded)
				{
					with instance_create(x, y, obj_jumpdust)
						image_xscale = other.xscale
					movespeed = 12
					crouchslipbuffer = 25
					grav = 0.5;
					sprite_index = spr_crouchslip;
					machhitAnim = false;
					state = states.crouchslide;
					if (audio_is_playing(sound_suplex1))
						audio_stop_sound(sound_suplex1);
				}
				else
				{

					image_index = 0
					state = states.machroll
					sprite_index = spr_dive
					vsp = 10
				}
			}
			if (key_jump && grounded)
			{
				sprite_index = spr_player_longjump;
				instance_create(x, y, obj_jumpdust);
				state = states.mach2;
				vsp = -11;
				if (audio_is_playing(sound_suplex1))
					audio_stop_sound(sound_suplex1);
			}
			if (character == characters.pizzano && !key_jump2 && !jumpstop && vsp < 0.5 && !stompAnim)
			{
				vsp /= 5;
				jumpstop = true;
			}
			if ((scr_solid(x + xscale, y) && !scr_slope_ext(x + xscale, y)) && !place_meeting(x + xscale, y, obj_destructibles) && grounded)
			{
				grav = 0.5;
				movespeed = 0;
				sprite_index = spr_player_suplexbump
				state = states.bump;
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
			if ((scr_solid(x + xscale, y) && !scr_slope_ext(x + xscale, y)) && !place_meeting(x + xscale, y, obj_destructibles) && !grounded)
			{
				wallspeed = 6
				grabclimbbuffer = 10
				state = states.climbwall;
			}
			image_speed = 0.3;
			if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
				instance_create(x, y, obj_slidecloud);
			break;
	}
	if (key_attack && floor(image_index) == (image_number - 1) && sprite_index != spr_player_bump)
	{
		state = states.mach2;
		sprite_index = spr_mach;
	}
	if (key_slap2 && !key_down)
	{
		if character == characters.pizzelle {
			sprite_index = spr_player_machtumble;
			image_index = 0;
			image_speed = 0.2;
			state = states.machtumble;
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
		}
		if character == characters.pizzano {
			sprite_index = spr_pizzano_shoulderbash;
			image_index = 0;
			movespeed = 10;
			state = states.pizzanokungfu;
			instance_create(x, y, obj_jumpdust);
		}
	}
}
