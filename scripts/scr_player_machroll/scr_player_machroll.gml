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
	if movespeed < 8
	movespeed = 8
	if (((!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16)) && grounded) && character == characters.pizzelle)
	{
  scr_sound(sound_rollgetup)
        sprite_index = spr_player_rollgetup
        image_index = 0
        mach2 = 35
        if ((movespeed >= 12))
            state = states.mach3
        else
            state = states.mach2
	}
	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	
		hsp = 0;
		image_speed = 0.35;
		combo = 0;
		state = states.bump;
		hsp = 0
		vsp = 0
		mach2 = 0;
			sprite_index = spr_player_wallsplat
		image_index = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{		
		hsp = 0;
		image_speed = 0.35;
		combo = 0;
		state = states.bump;
		hsp = 0
		vsp = 0
		mach2 = 0;
		sprite_index = spr_player_wallsplat
		image_index = 0;
		instance_create(x - 10, y + 10, obj_bumpeffect);
	}
	if (!instance_exists(obj_cloudeffect) && grounded)
		instance_create(x, y + 43, obj_cloudeffect);
	image_speed = 0.8;
    if (grounded && movespeed < 12)
        sprite_index = spr_machroll
    else if (grounded && movespeed >= 12 && sprite_index != spr_player_mach3roll && sprite_index != spr_player_rollgetup)
        sprite_index = spr_player_mach3roll
    else if (sprite_index != spr_dive && (!grounded))
    {
        sprite_index = spr_dive
        vsp = 10
    }
   else if (key_jump2 && (!grounded))
    {
        sprite_index = spr_player_bodyslamstart
        vsp = -7
        state = states.freefallprep
    }
   if (scr_solid((x + xscale), y) && (sprite_index == spr_dive) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        sprite_index = spr_player_wallsplat
        state = states.bump
    }
	if (key_jump2 && character == characters.pizzano)
	{
		sprite_index = spr_pizzano_twirl;
		state = states.pizzanotwirl;
		vsp = -12;
	}
}
