function scr_playersounds()
{
	if (state == states.machroll)
	{
		if (!audio_is_playing(sound_tumble))
			scr_sound(sound_tumble);
	}
	else
		audio_stop_sound(sound_tumble);
	if (!audio_is_playing(sfx_railgrind) && state == states.minecart && grounded)
		scr_sound(sfx_railgrind);
	else if (state != states.minecart || !grounded)
		audio_stop_sound(sfx_railgrind);
	if (state == states.mach1 && (!audio_is_playing(sound_dash1) && grounded))
		scr_sound(sound_dash1);
	else if (state != states.mach1 || (!grounded || move == -xscale))
		audio_stop_sound(sound_dash1);
	if (sprite_index == spr_mach && !audio_is_playing(sound_dash2))
		scr_sound(sound_dash2);
	else if (sprite_index != spr_mach)
		audio_stop_sound(sound_dash2);
	if (((state == states.mach3 && sprite_index != spr_player_crazyrun) || sprite_index == spr_player_machslideboost3) && !audio_is_playing(sound_maxspeed))
		scr_sound(sound_maxspeed);
	else if ((state != states.mach3 && sprite_index != spr_player_machslideboost3) || sprite_index == spr_player_crazyrun)
		audio_stop_sound(sound_maxspeed);
	if (sprite_index == spr_player_crazyrun && !audio_is_playing(sound_dash3))
		scr_sound(sound_dash3);
	else if (sprite_index != spr_player_crazyrun)
		audio_stop_sound(sound_dash3);
	// cotton related sound control
	if (state == states.cottonroll && sprite_index == spr_cotton_run)
	{
		if (!audio_is_playing(sound_customdash1))
			scr_sound(sound_customdash1);
	}
	else
		audio_stop_sound(sound_customdash1);
	if (state == states.cottonroll && sprite_index == spr_cotton_maxrun)
	{
		if (!audio_is_playing(sound_customdash2))
			scr_sound(sound_customdash2);
	}
	else
		audio_stop_sound(sound_customdash2);
		
	if (sprite_index == spr_mach2jump)
	{
		if (!audio_is_playing(sfx_flip))
			scr_sound(sfx_flip);
	}
	if (audio_is_playing(sfx_flip) && sprite_index != spr_mach2jump && sprite_index != spr_player_wallkickloop)
		audio_stop_sound(sfx_flip);
}
