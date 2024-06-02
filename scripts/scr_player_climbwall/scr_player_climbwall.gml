function scr_player_climbwall()
{
	if (windingAnim < 200)
		windingAnim++;
	suplexmove = false;
	vsp = -wallspeed;
	if (wallspeed > 0)
		wallspeed += 0.05;
	crouchslideAnim = true;
	sprite_index = spr_climbwall;
	if wallrunBuffer >= 0
		wallrunBuffer -= 0.1
	if (wallspeed <= 0 || !key_attack && wallrunBuffer == 0  && !(sprite_index == spr_player_wallkick || sprite_index == spr_player_wallkickloop))
	{
		state = states.jump;
		sprite_index = spr_fall;
	}
	if (!scr_solid(x + xscale, y, true) && !(sprite_index == spr_player_wallkick || sprite_index == spr_player_wallkickloop))
	{
		instance_create(x, y, obj_jumpdust);
		vsp = 0;
		if (mach2 < 100)
			state = states.mach2;
		else if (mach2 >= 100)
		{
			state = states.mach3;
			sprite_index = spr_player_mach3;
		}
		else
		{
			state = states.jump;
			vsp = -wallspeed;
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
	if (key_jump)
	{
			instance_create(x, y, obj_jumpdust);
			vsp = -12;
			sprite_index = spr_player_mach2jump;
			xscale *= -1;
			vsp = 5 * xscale
	}
	if (sprite_index == spr_player_mach2jump)
		sprite_index = spr_player_wallkick
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_wallkick)
		sprite_index = spr_player_wallkickloop
	if (key_slap2 && sprite_index == spr_player_wallkickloop)
	{
			instance_create(x, y, obj_jumpdust);
			sprite_index = spr_player_mach3;
			state = states.mach3
			vsp = -9
			movespeed += 2
	}
	if (grounded && sprite_index == spr_player_wallkickloop)
	{
			instance_create(x, y, obj_jumpdust);
			sprite_index = spr_player_mach3;
			state = states.mach3
			movespeed += 2
	}
	image_speed = 0.6;
	if (!instance_exists(obj_cloudeffect))
		instance_create(x, y + 43, obj_cloudeffect);
}
