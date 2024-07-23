function scr_player_tumble()
{
	mask_index = spr_crouchmask;
	hsp = xscale * movespeed;
	if (sprite_index == spr_tumblestart)
		movespeed = 6;
    if !grounded && (sprite_index == spr_crouchslip || sprite_index == spr_machroll || sprite_index == spr_mach2jump)
    {
		vsp = 10
		sprite_index = spr_dive
    state = states.machroll
}
	
	if (!scr_slope() && sprite_index == spr_tumblestart && floor(image_index) < 11)
		image_index = 11;
	if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
		sprite_index = spr_tumble;
	if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		hsp = 0;
		movespeed = 0;
        if (sprite_index == spr_tumble || sprite_index == spr_tumblestart)
        {
			scr_sound(sound_tumbleend);
			sprite_index = spr_tumbleend;
			state = states.bump;
			image_index = 0;
		}
        else
        {
            scr_sound(sound_bump)
            state = states.bump
            image_index = 0
            sprite_index = spr_player_bump
        }
	}
	if (key_jump)
		input_buffer_jump = 0;
	if (!key_jump2 && !jumpstop && vsp < 0.5 && !stompAnim)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (input_buffer_jump < 8 && grounded && hsp != 0 && (sprite_index == spr_tumble || sprite_index == spr_tumblestart))
		vsp = -9;
	image_speed = 0.35;
	if (!audio_is_playing(sound_tumble))
		scr_sound(sound_tumble);
	if (place_meeting(x, y, obj_slope) && xscale == 1)
		x -= 2;
	if (place_meeting(x, y, obj_slope) && xscale == -1)
		x += 2;
    if crouchslipbuffer > 0
        crouchslipbuffer--
    if !key_down && key_attack && grounded && state != states.bump && sprite_index != spr_tumble && sprite_index != spr_tumbleend && !scr_solid(x, y - 16) && !scr_solid(x, y - 32)
    {
        if crouchslipbuffer == 0
        {
            with instance_create(x, y, obj_jumpdust)
                image_xscale = other.xscale
            if movespeed >= 12
                state = states.mach3
            else
                state = states.mach2
            image_index = 0
            sprite_index = spr_player_rollgetup
            scr_sound(sound_rollgetup)
        }
    }
    if !key_down && !key_attack && grounded && vsp > 0 && state != states.bump && sprite_index != spr_tumble && sprite_index != spr_tumbleend && !scr_solid(x, y - 16) && !scr_solid(x, y - 32)
    {
        if crouchslipbuffer == 0
        {
            if movespeed > 6
            {
                state = states.machslide
                sprite_index = spr_machslidestart
                image_index = 0
            }
            else
                state = states.normal
        }
    }
    if sprite_index == spr_crouchslip || sprite_index == spr_machroll || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_machroll || sprite_index == spr_mach2jump
        image_speed = abs(movespeed) / 15
}