function scr_player_cotton()
{
	// cotton transition
	if ((sprite_index == spr_player_cottontransfo))
    {
        hsp = 0;
        if (animation_end())
        {
            xscale *= -1;
            sprite_index = spr_cotton_land;
            image_speed = 0.35;
        }
		
		return;
    }
	move = key_left + key_right;
	// if your direction does not equal your xscale, kill all speed
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	
	if (sprite_index != spr_cotton_attack)
	{
		if (move != 0)
			xscale = move;
	}
	hsp = xscale * movespeed;
    if (move != 0)
    {
		// if movespeed is under 6, go faster
		if movespeed < 6
	        movespeed += 0.5;
	    // if youre going a bit too fast and arent attacking, slow down
		if (movespeed > 6 && sprite_index != spr_cotton_attack && grounded)
			movespeed -= 0.5;
    }
	else if (movespeed > 0 && sprite_index != spr_cotton_attack)
		movespeed -= 0.5;
	// clamp vsp
	vsp = clamp(vsp, -infinity, 7)
	// jumping
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
		hsp = 14 * xscale;
		movespeed = 0;
		instance_create(x, y, obj_swordhitbox);
		move = xscale;
		vsp = 0;
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