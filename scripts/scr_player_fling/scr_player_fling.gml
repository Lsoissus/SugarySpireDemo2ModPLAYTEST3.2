function scr_player_fling()
{
	image_speed = 0.35;
	if animation_end() {
		switch sprite_index {
			case spr_player_candybegin:
				sprite_index = spr_player_candyidle;
				image_index = 0;
			break;
			case spr_player_candytransitionup:
				sprite_index = spr_player_candyup;
				image_index = 0;
			break;
		}
	}
	if (key_slap2 || key_attack2)
	{
		if move != 0
			xscale = move;
		instance_create(x, y, obj_jumpdust);
		sprite_index = spr_player_airkickstart
		image_index = 0;
		state = states.mach3
		vsp = -5
		audio_stop_sound(sfx_flip)
		scr_sound(sound_suplex1)
		movespeed = 12;
		mach2 = 100;
		with (instance_create(x, y, obj_crazyrunothereffect))
			image_xscale = other.xscale;
		exit;
	}
	if sprite_index != spr_player_candybegin && sprite_index != spr_player_candyidle
	{
		move = key_left + key_right;
		if (!momemtum)
			hsp = move * movespeed;
		else
			hsp = xscale * movespeed;
		if (move != xscale && momemtum && movespeed != 0)
			movespeed -= 0.1;
		if (movespeed == 0)
			momemtum = false;
		if (move == 0 && !momemtum) || scr_solid(x + hsp, y)
		{
			movespeed = 0;
			mach2 = 0;
		}
		if (move != 0 && movespeed < 7)
			movespeed += 0.5;
		if (movespeed > 7)
			movespeed -= 0.1;
		if (scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1)
			movespeed = 0;
		landAnim = true;
		if (grounded && vsp > 0 && !key_attack)
		{
			if (key_attack)
				landAnim = false;
			state = states.normal;
			jumpAnim = true;
			jumpstop = false;
			image_index = 0;
			freefallstart = 0;
			instance_create_depth(x, y, 0, obj_landcloud);
			scr_sound(sound_step);
			doublejumped = false;
		}
	}
}