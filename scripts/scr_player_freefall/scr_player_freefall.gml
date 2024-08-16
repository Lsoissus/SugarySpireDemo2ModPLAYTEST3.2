function scr_player_freefall()
{
	landAnim = true;
	move = key_left + key_right;
	 if (!grounded)
    {
        vsp += 0.5
        if ((hsp != xscale) && (momemtum == 1) && (hsp != 0))
        {
            if ((move != 0))
            {
                if ((move == 1))
                    hsp -= 0.05
                else if ((move == -1))
                    hsp += 0.05
            }
        }
        if ((hsp == 0))
            momemtum = false
        if ((move != dir) && (move != 0))
        {
            dir = move
            hsp = 0
        }
        if (((move == 0) && (momemtum == 0)) || scr_solid((x + hsp), y))
        {
            hsp = 0
            mach2 = 0
        }
        if ((move != 0) && (hsp < 7))
        {
            if ((move != 0))
            {
                if ((move == 1))
                    hsp += 0.25
                else if ((move == -1))
                    hsp -= 0.25
            }
        }
        if ((hsp > 7))
        {
            if ((move != 0))
            {
                if ((move == 1))
                    hsp -= 0.05
                else if ((move == -1))
                    hsp += 0.05
            }
        }
	  if ((sprite_index != spr_player_pound) && (sprite_index != spr_player_poundend) && (sprite_index != spr_player_poundprepare))
        {
            if ((move != 0))
                xscale = move
        }
    }
    if ((sprite_index == spr_player_bodyslamstart) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_player_bodyslamfall
    if ((sprite_index == spr_player_poundprepare) && (floor(image_index) == (image_number - 1)))
        sprite_index = spr_player_pound
	if (global.cane)
		sprite_index = spr_caneslam;
	if ((grounded && vsp > 0 && !input_buffer_jump < 8) && !place_meeting(x, y + 1, obj_destructibles) && (!(place_meeting(x, (y + 1), obj_vertical_hallway))) && (!(place_meeting(x, (y + vsp), obj_vertical_hallway))))
	{
		if (scr_slope() && !place_meeting(x, y, obj_dashpad))
		{
			flash = false;
            if ((move == 0) && (!key_down))
            {
                sprite_index = spr_machslidestart
                state = states.machslide
            }
            else
			state = states.machroll;
			movespeed = 12;
			if (place_meeting(x, y + 1, obj_slope))
			{
				with (instance_place(x, y + 1, obj_slope))
					other.xscale = -sign(image_xscale);
			}
		}
		else if ((!scr_slope()) && (!(place_meeting(x, y, obj_dashpad))))
		{
			scr_sound(sound_maximumspeedland);
			image_index = 0;
			state = states.freefallland;
			jumpAnim = true;
			jumpstop = false;
			with (obj_baddie)
			{
				if (point_in_camera(x, y, view_camera[0]) && grounded)
				{
					vsp = -7;
					hsp = 0;
				}
			}
			with (obj_camera)
			{
				shake_mag = 10;
				shake_mag_acc = 30 / room_speed;
			}
			combo = 0;
			bounce = false;
			instance_create(x, y, obj_landcloud);
			freefallstart = 0;
		 if ((sprite_index == spr_player_pound))
                sprite_index = spr_player_poundend
            else
                sprite_index = spr_player_bodyslamland
		}
	}
	if (place_meeting(x, y + 1, obj_destructibles))
		vsp = 20;
	image_speed = 0.35;
	freefallsmash++;
	if (freefallsmash > 10 && !instance_exists(obj_groundpoundeffect))
		instance_create_depth(x, y, -6, obj_groundpoundeffect);
	if (key_slap2 && !grounded && vsp > 10 && instance_exists(obj_groundpoundeffect))
	{
		if (move != 0)
			xscale = move;
		movespeed = 10;
		machhitAnim = false;
		state = states.mach2;
		flash = true;
		vsp = -7;
		sprite_index = spr_mach2jump;
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
		freefallsmash = false;
	}
}
