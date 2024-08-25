function scr_player_cotton()
{
	 if ((sprite_index == spr_player_cottontransfo))
    {
        hsp = 0
        if animation_end()
        {
            xscale *= -1
            sprite_index = spr_cotton_land
            with (obj_cottoncreator)
                visible = true
            image_speed = 0.35
        }
    }
	else
	{
	var dreaming = false;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = key_left + key_right;
	if (sprite_index != spr_cotton_attack)
	{
		if (move != 0)
			xscale = move;
	}
	if ((move != 0 && move != xscale) || grounded) && momemtum
		momemtum = false;
	if !momemtum
		hsp = move * movespeed;
	else
		hsp = xscale * movespeed;
    if move != 0
    {
		if key_attack && move == xscale && grounded
		{
			if movespeed < 8
				movespeed += 0.25;
		}
		else
		{
			if movespeed < 6
		        movespeed += 0.5;
			if movespeed > 6 && sprite_index != spr_cotton_attack && grounded && !momemtum
				movespeed -= 0.5;
		}
    }
	else if movespeed > 0 && sprite_index != spr_cotton_attack && !momemtum
		movespeed -= 0.5;
	if scr_solid(x + xscale, y, true) && !scr_slope_ext(x + xscale, y)
	{
		if movespeed < 8 && (place_meeting(x + xscale, y, obj_destructibles) || place_meeting(x + xscale, y, obj_chocofrogbig))
			movespeed = 0;
		else if !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrogbig)
		{
			if movespeed >= 8 && grounded && sprite_index != spr_cotton_slam && sprite_index != spr_cotton_attack
			{
				sprite_index = spr_cotton_slam;
				image_index = 0;
			}
			movespeed = 0;
		}
	}
	if (vsp > 5)
		vsp = 5;
	if (key_jump && grounded)
	{
		vsp = -14;
		grav = 0.025;
		image_index = 0;
		sprite_index = spr_cotton_jump;
		instance_create(x, y, obj_highjumpcloud2);
		scr_sound(sfx_cottonjump);
	}
	if (key_slap2 && sprite_index != spr_cotton_attack)
	{
		flash = true;
		image_index = 0;
		sprite_index = spr_cotton_attack;
		grounded = false;
		vsp = -5;
		grav = 0.2;
		scr_sound(sfx_cottonattack);
		groundedcot = false;
	}
	if (sprite_index == spr_cotton_attack)
	{
		if (place_meeting(x + sign(hsp), y, obj_dreamblock))
			dreaming = true;
		if (!dreaming)
		{	
			hsp = 8 * xscale;
			if movespeed < 8
				movespeed = 8;
			instance_create(x, y, obj_swordhitbox);
			move = xscale;
			if (-key_left2 && xscale == 1) || (key_right2 && xscale == -1)
			{
				movespeed = 0;
				vsp = 0;
				hsp = 0;
				sprite_index = spr_cotton_fall;
			}
		}
		else
		{
			hsp = 14 * xscale;
			movespeed = 0;
			instance_create(x, y, obj_swordhitbox);
			move = xscale;
			vsp = 0;
		}
	}
	if (dreaming && !place_meeting(x + sign(hsp), y, obj_dreamblock))
	{
		dreaming = false;
		sprite_index = spr_cotton_fall;
	}
    if animation_end() && (sprite_index == spr_cotton_attack || sprite_index == spr_cotton_slam)
    {
        image_index = 0;
        sprite_index = spr_cottonidle;
    }
	if ((sprite_index == spr_cottonidle || sprite_index == spr_cotton_slam || sprite_index == spr_cotton_land2) && move != 0)
	{
		image_index = 0;
		sprite_index = spr_cotton_walk;
	}
	if (sprite_index == spr_cotton_walk && move == 0)
	{
		image_index = 0;
		sprite_index = spr_cottonidle;
	}
	if (sprite_index == spr_cotton_jump && animation_end())
	{
		image_index = 0;
		sprite_index = spr_cotton_fall;
	}
	if (sprite_index == spr_cotton_doublejump && animation_end())
	{
		image_index = 0;
		sprite_index = spr_cotton_doublefall;
	}
	if ((sprite_index == spr_cotton_fall || sprite_index == spr_cotton_doublefall || sprite_index == spr_cotton_jump || sprite_index == spr_cotton_doublejump) && grounded && vsp >= 0)
	{
		image_index = 0;
		if move != 0
			sprite_index = spr_cotton_land2;
		else
			sprite_index = spr_cotton_land;
		instance_create(x, y, obj_landcloud);
		scr_sound(sound_land);
	}
	if (sprite_index == spr_cotton_attack && key_jump)
	{
		vsp = -15;
		grav = 0.1;
		image_index = 0;
		sprite_index = spr_cotton_jump;
		with (instance_create(x, y, obj_highjumpcloud2))
		{
			image_xscale = other.xscale;
			sprite_index = spr_cottonpoof;
		}
		scr_sound(sfx_cottondoublejump);
	}
    if !grounded && key_jump && !doublejumped
    {
		doublejumped = true;
        vsp = -10;
        image_index = 0;
        sprite_index = spr_cotton_doublejump;
        with (instance_create(x, y, obj_highjumpcloud2))
        {
            image_xscale = other.xscale;
            sprite_index = spr_cottonpoof;
        }
        scr_sound(sfx_cottondoublejump);
    }
	if (sprite_index == spr_cotton_land && animation_end())
		sprite_index = spr_cottonidle;
	if key_down2 && move != 0 && grounded
	{
		vsp = 3;
		state = states.cottonroll;
		sprite_index = spr_cotton_roll;
		image_index = 0;
		if movespeed < 3
			movespeed = 3;
	}
	if (key_down2 && !grounded && drill && sprite_index != spr_cotton_slam)
	{
		ctndrlspd = -5;
		state = states.cottondrill;
		sprite_index = spr_cotton_drill;
		image_index = 0;
		scr_sound(sound_suplex1);
		flash = true;
		with (instance_create(x, y, obj_afterimageoutward))
			hspeed = 7;
		with (instance_create(x, y, obj_afterimageoutward))
			hspeed = -7;
		with (instance_create(x, y, obj_afterimageoutward))
			vspeed = 7;
		with (instance_create(x, y, obj_afterimageoutward))
			vspeed = -7;
	}
	if (key_up2 && !grounded && drill && sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3)
	{
		vsp = -18;
		state = states.cottondrill;
		sprite_index = spr_cotton_drillup;
		image_index = 0;
		scr_sound(sound_suplex1);
		flash = true;
		drill = false;
		with (instance_create(x, y, obj_afterimageoutward))
			hspeed = 7;
		with (instance_create(x, y, obj_afterimageoutward))
			hspeed = -7;
		with (instance_create(x, y, obj_afterimageoutward))
			vspeed = 7;
		with (instance_create(x, y, obj_afterimageoutward))
			vspeed = -7;
	}
    if !grounded && sprite_index != spr_cotton_jump && sprite_index != spr_cotton_attack && sprite_index != spr_cotton_doublejump && sprite_index != spr_cotton_doublefall && sprite_index != spr_cotton_drill
        sprite_index = spr_cotton_fall;
	if !key_jump2 && !jumpstop && vsp < 0.5
	{
	    vsp /= 20;
	    jumpstop = true;
	}
	if grounded && vsp > 0
	{
	    jumpstop = 0;
		doublejumped = 0;
	}
    if sprite_index == spr_cotton_walk
        image_speed = clamp(movespeed / 6 * 0.65, 0.35, 1)
    else
        image_speed = 0.35
	static cotton_afterimagetimer = 6;
	if cotton_afterimagetimer > 0
		cotton_afterimagetimer--
	if cotton_afterimagetimer <= 0
	{
		with instance_create(x, y, obj_cotton_aftereffect)
			playerID = other.id;
		cotton_afterimagetimer = 6;
	}
	}
}