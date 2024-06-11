function scr_pizzano_shoulderbash()
{
	move = key_right + key_left;
	if move == xscale
		hsp = xscale * movespeed;
	if move != xscale && move != 0
		hsp = move * movespeed;
	if (key_jump && grounded)
	{
		state = states.pizzanotwirl;
		vsp = -12;
	}
	if (scr_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		movespeed = -3.5;
		vsp = -8;
		mach2 = 0;
		state = states.bump;
		image_index = 0;
		machslideAnim = true;
		machhitAnim = false;
		instance_create(x + 10, y + 10, obj_bumpeffect);
		if (audio_is_playing(sound_suplex1))
			audio_stop_sound(sound_suplex1);
		scr_sound(sound_bump);
	}
	if (key_attack2 && grounded)
	{
		if move != 0
			xscale = move;
		flash = true;
		state = states.mach2;
		movespeed = 10;
		image_index = 0;
		sprite_index = spr_mach;
		jumpstop = false;
	}
	
	// duration
	static shoulderTime = 35;
	
	if shoulderTime > 0
		shoulderTime--
	if shoulderTime <= 0
		state = states.normal;
	
	if state != states.pizzanoshoulderbash
		shoulderTime = 35;
}
