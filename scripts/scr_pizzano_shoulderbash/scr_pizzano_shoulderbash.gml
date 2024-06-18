function scr_pizzano_shoulderbash()
{
	// basic movement
	hsp = xscale * movespeed;
	
	// jumping
	if (key_jump && grounded)
	{
		state = states.pizzanotwirl;
		vsp = -12;
	}
	
	// collision
	if (scr_solid(x + xscale, y) && !scr_slope_ext(x + xscale, y)) && !place_meeting(x + xscale, y, obj_destructibles)
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
	
	// cancel shoulderbash
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
	
	if (shoulderTime > 0)
		shoulderTime--
	if (shoulderTime <= 0)
		state = states.normal;
	
	if (state != states.pizzanoshoulderbash)
		shoulderTime = 35;
}
