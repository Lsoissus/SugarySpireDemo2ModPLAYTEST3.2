function scr_pizzano_kungfuCookie()
{
	move = (key_right + key_left);
	hsp = xscale * movespeed;
	if move != 0
	{
		if (move == xscale && movespeed < 12)
			movespeed += 0.5;
		else if (move != xscale && movespeed > -12)
			movespeed -= 0.25;
	}
	else
	{
	}
	if (key_jump && grounded)
	{
		state = states.pizzanotwirl;
		vsp = -12;
		tauntstoredmovespeed = movespeed;
	}
	if animation_end()
	{
		if key_attack
		{
			state = states.mach2;
			if movespeed < 8
				movespeed = 8;
		}
		else
			state = states.normal;
	}
	if ((scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope)) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		if grounded
		{
			movespeed = -3.5;
			vsp = -8;
			mach2 = 0;
			state = states.bump;
			image_index = 0;
			machslideAnim = true;
			machhitAnim = false;
			instance_create(x + 10, y + 10, obj_bumpeffect);
			if (audio_is_playing(sound_suplex1))
				audio_stop_sound(sound_suplex1);
			scr_sound(sound_bump);
		}
		else 
		{
			wallspeed = clamp(movespeed, 10, 24);
			state = states.climbwall;
		}
	}
	image_speed = 0.35;
}