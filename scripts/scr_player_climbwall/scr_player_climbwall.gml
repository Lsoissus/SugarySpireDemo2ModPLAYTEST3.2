function scr_player_climbwall()
{
	if (windingAnim < 200)
		windingAnim++;
	suplexmove = false;
	vsp = -wallspeed;
	/*
	if (wallspeed > 0)
		wallspeed -= 0.25;
		*/
	if wallspeed < 20
		wallspeed += 0.15;
	if wallspeed < 0
	{
		if mach4mode == 0
			movespeed += 0.025;
		else
			movespeed += 0.1;
	}
	crouchslideAnim = true;
	sprite_index = spr_climbwall;
	if grabclimbbuffer > 0
		grabclimbbuffer--;
	if (wallspeed <= 0 || (!key_attack && grabclimbbuffer <= 0))
	{
		state = states.jump;
		sprite_index = spr_fall;
	}
	if (!scr_solid(x + xscale, y, true))
	{
		instance_create(x, y, obj_jumpdust);
		vsp = 0;
		if (movespeed < 6)
		{
			state = states.jump;
			vsp = -wallspeed;
		}
		else if (movespeed < 12)
		{
			state = states.mach2;
			movespeed = wallspeed;
		}
		else if movespeed >= 12
		{
			state = states.mach3;
			movespeed = wallspeed;
			sprite_index = spr_player_mach4;
		}
	}
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !scr_slope_ext(x + sign(hsp), y) && !scr_slope_ext(x - sign(hsp), y))
	{
		sprite_index = spr_player_ceilingcrash;
		scr_sound(sound_maximumspeedland);
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = false;
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
	}
	if (key_jump && key_attack)
	{
		if !audio_is_playing(sound_jump)
			scr_sound(sound_jump);
		if (wallspeed >= 12)
		{
			mach2 = 100;
			instance_create(x, y, obj_jumpdust);
			vsp = -9;
			sprite_index = spr_player_mach3jump;
			state = states.mach3;
			xscale *= -1;
			jumpstop = false;
		}
		else if !place_meeting(x + xscale, y, obj_molassesWall)
		{
			sprite_index = spr_player_secondjump1;
			mach2 = 35;
			instance_create(x, y, obj_jumpdust);
			vsp = -9;
			state = states.mach2;
			xscale *= -1;
			jumpstop = false;
		}
		else
		{
			sprite_index = spr_player_mach2jump;
			mach2 = 35;
			instance_create(x, y, obj_jumpdust);
			vsp = -9;
			state = states.mach2;
			xscale *= -1;
			jumpstop = false;
		}
	}
	image_speed = 0.6;
	if (!instance_exists(obj_cloudeffect))
		instance_create(x, y + 43, obj_cloudeffect);
}