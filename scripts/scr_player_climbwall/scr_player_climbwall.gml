function scr_player_climbwall()
{
if windingAnim < 200
		windingAnim++;
	suplexmove = false;
	vsp = -wallspeed;
	if (!place_meeting(x, y, obj_molassesWall)) {
	    if wallspeed < 20
	        wallspeed += 0.15
	    if wallspeed > 0
			movespeed += ((!mach4mode) ? 0.2 : 0.4);
	}
	crouchslideAnim = true;
	if wallspeed >= 12
	sprite_index = spr_player_climbwallmach3
	else
	sprite_index = spr_climbwall;
/*	if wallspeed < 6
		wallspeed = 6*/
	if grabclimbbuffer > 0
		grabclimbbuffer--
	if (wallspeed <= 0 || !key_attack) && grabclimbbuffer == 0  && sprite_index != spr_player_wallkick && sprite_index != spr_player_wallkickloop
	{
		state = states.jump;
		sprite_index = spr_fall;
		wallrunBuffer = 0
	}
	if !scr_solid(x + xscale, y, true) && sprite_index != spr_player_wallkick && sprite_index != spr_player_wallkickloop
	{
		instance_create(x, y, obj_jumpdust);
		vsp = 0;
		wallrunBuffer = 0
		var old_x = x
		var old_y = y
		var i = 0
		while !scr_solid(x + xscale, y)
		{
			i++
			y++
			if scr_solid(x + xscale, y)
			{
				y--
				break
			}
			else if i > 40
			{
				x = old_x
				y = old_y
				break
			}
		}
		if wallspeed < 6
			wallspeed = 6
		if wallspeed >= 6 && wallspeed < 12
		{
			state = states.mach2
			movespeed = wallspeed
		}
		else if wallspeed >= 12
		{
			state = states.mach3
			sprite_index = spr_mach3
			movespeed = wallspeed
		}
		else
		{
			state = states.jump;
			vsp = -wallspeed;
		}
		hsp = xscale
	}
	if scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !scr_slope_ext(x + sign(hsp), y) && !scr_slope_ext(x - sign(hsp), y)
	{
		wallrunBuffer = 0
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
	if key_jump && key_attack
	{
		wallrunBuffer = 0
		instance_create(x, y, obj_jumpdust);
		vsp = -12;
		sprite_index = spr_player_wallkick;
		image_index = 0;
		state = states.wallkick
	     movespeed = hsp
		kickclimbbuffer = 7
	}
	image_speed = 0.6;
	if !instance_exists(obj_cloudeffect)
		instance_create(x, y + 43, obj_cloudeffect);
}