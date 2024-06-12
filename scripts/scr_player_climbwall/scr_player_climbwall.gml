function scr_player_climbwall()
{
	if windingAnim < 200
		windingAnim++;
	suplexmove = false;
	vsp = -wallspeed;
    if wallspeed < 24
        wallspeed += 0.15
    if wallspeed > 0
    {
         if wallspeed < 20
            movespeed += 0.2
         else
            movespeed += 0.4
    }
	crouchslideAnim = true;
	sprite_index = spr_climbwall;
/*	if wallspeed < 6
		wallspeed = 6*/
	if wallrunBuffer >= 0
		wallrunBuffer -= 0.1
	if (wallspeed <= 0 || !key_attack) && wallrunBuffer <= 0  && sprite_index != spr_player_wallkick && sprite_index != spr_player_wallkickloop
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
		if mach2 < 100
			state = states.mach2;
		else if mach2 >= 100
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
		xscale *= -1;
		state = states.wallkick
	}
	image_speed = 0.6;
	if !instance_exists(obj_cloudeffect)
		instance_create(x, y + 43, obj_cloudeffect);
	
}