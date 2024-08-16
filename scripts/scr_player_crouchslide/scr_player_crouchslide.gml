function scr_player_crouchslide()
{
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
		hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (xscale * movespeed) + 5;
    if crouchslipbuffer > 0
		crouchslipbuffer--
	mask_index = spr_crouchmask;
    if !key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16)
    {
		if crouchslipbuffer <= 0
		{
			image_index = 0;
			scr_sound(sound_rollgetup);
			if movespeed >= 12
				state = states.mach3;
			else
				state = states.mach2;
			if character == characters.pizzelle
			    sprite_index = spr_player_rollgetup;
		}
    }
    if scr_solid(x + xscale, y, 1) && !place_meeting(x + sign(hsp), y, obj_destructibles)
    {
        movespeed = 0;
        state = 69;
        hsp = xscale * -2.5;
        vsp = -3;
        mach2 = 0;
        image_index = 0;
        machslideAnim = true;
        machhitAnim = false;
        instance_create(x + (xscale * 10), y + (xscale * 10), obj_bumpeffect);
    }
     if ((sprite_index != spr_dive) && (!grounded))
    {
        sprite_index = spr_dive
        state = states.machroll
        vsp = 10
    }
   if !instance_exists(obj_slidecloud) && grounded && movespeed > 5
        instance_create(x, y, obj_slidecloud);
    image_speed = 0.35;
}