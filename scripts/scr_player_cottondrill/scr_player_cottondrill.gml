function scr_player_cottondrill()
{
	image_speed = 0.35;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = key_left + key_right;
	if (move != 0)
		xscale = move;
	if ctndrlspd < 9
	{
		ctndrlspd = approach(ctndrlspd, 20, 2);
		hsp = move * 5;
	}
	else
	{
		ctndrlspd = approach(ctndrlspd, 20, 0.5);
		hsp = move;
	}
	vsp = ctndrlspd; // HACK: We need to make a new variable as static doesn't work with approach
// and other things influence the vsp. Not ideal but it's more efficient than making a bunch of
// if statements all over the place
	if sprite_index != spr_cotton_drill && sprite_index != spr_cotton_drillup
		sprite_index = spr_cotton_drill;
	if (grounded && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_chocofrogbig))
	{
		doublejumped = false;
		if place_meeting(x, y + 1, obj_slope)
		{
			movespeed = ctndrlspd / 20 * 12;
			vsp = 3;
			state = states.cottonroll;
			image_index = 0;
			sprite_index = spr_cotton_roll;
			with instance_place(x, y + 1, obj_slope)
				other.xscale = -sign(image_xscale)
		}
		else
		{
			state = states.cotton;
			sprite_index = spr_cotton_land;
			vsp = 0;
			movespeed = 0;
			image_index = 0;
		}
	}
	if (key_slap2 && sprite_index != spr_cotton_attack && groundedcot)
	{
		state = states.cotton;
		flash = true;
		image_index = 0;
		sprite_index = spr_cotton_attack;
		grounded = false;
		if movespeed < 8
			movespeed = 8;
		if !grounded
			vsp = -5;
		else
			vsp = 0;
		grav = 0.2;
		scr_sound(sound_suplex1);
		groundedcot = false;
	}
	if (key_jump && !grounded && !doublejumped)
	{
		doublejumped = true;
		state = states.cotton;
		movespeed = 0;
		vsp = -10;
		grav = 0.1;
		image_index = 0;
		sprite_index = spr_cotton_doublejump;
		instance_create(x, y, obj_highjumpcloud2);
		with (instance_create(x, y, obj_highjumpcloud2))
		{
			image_xscale = other.xscale;
			sprite_index = spr_cottonpoof;
		}
		scr_sound(sound_jump);
	}
	static cotton_afterimagetimer = 6;
	if cotton_afterimagetimer > 0
		cotton_afterimagetimer--;
	if cotton_afterimagetimer <= 0
	{
		with instance_create(x, y, obj_cotton_aftereffect)
			playerID = other.id;
		cotton_afterimagetimer = 6;
	}
}
