function scr_player_machroll()
{
	if (!place_meeting(x, y + 1, obj_railh))
		hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (xscale * movespeed) + 5;
	mach2 = 100;
	machslideAnim = true;
	move = key_right + key_left;
	if (grounded)
	{
		if sprite_index != spr_player_machslide
			sprite_index = spr_machroll;
	}
	else if (sprite_index != spr_dive)
	{
		sprite_index = spr_dive;
		vsp = 10;
	}
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		state = states.bump;
		sprite_index = spr_player_wallsplat;
		image_index = 0;
	}
	if (!instance_exists(obj_cloudeffect) && grounded)
		instance_create(x, y + 43, obj_cloudeffect);
	image_speed = 0.8;
	if crouchslipbuffer == 0 && grounded && !key_down && state != states.bump
	{
		if !scr_solid(x + (27 * xscale), y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16)
		{
			if key_attack
			{
				with (instance_create(x, y, obj_jumpdust))
					image_xscale = other.xscale;
				if movespeed >= 12
					state = states.mach3;
				else
					state = states.mach2;
				image_index = 0;
				sprite_index = spr_player_rollgetup;
				scr_sound(sound_rollgetup);
			}
			else
			{
				if movespeed > 6
				{
					state = states.machslide;
					sprite_index = spr_machslidestart;
					image_index = 0;
				}
				else
					state = states.normal;
			}
		}
	}
	if (key_jump2 && character == "N")
	{
		sprite_index = spr_pizzano_twirl;
		state = states.pizzanotwirl;
		vsp = -12;
	}
	if key_jump && sprite_index = spr_dive
	{
		vsp = -6;
		state = states.freefallprep;
		image_index = 0;
		sprite_index = spr_player_bodyslamstart;
	}
	if crouchslipbuffer > 0
		crouchslipbuffer--;
}