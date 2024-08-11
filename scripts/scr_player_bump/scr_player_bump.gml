function scr_player_bump()
{
	movespeed = 0;
	mach2 = 0;
	start_running = true;
	alarm[4] = 14;
	if ((grounded && vsp > 0))
		hsp = 0;
	if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_suplexbump)
		state = states.normal;
	if (grounded && (sprite_index == spr_player_suplexbump) && (sprite_index != spr_player_wallsplat))
		state = states.normal;
	if ((sprite_index == spr_player_wallsplat) && (vsp > 0))
        vsp = 0
	if ((sprite_index != spr_player_catched && (sprite_index != spr_tumbleend && sprite_index != spr_mach3hitwall)) && sprite_index != spr_pizzano_shoulderbash && sprite_index != spr_player_suplexbump && (sprite_index != spr_player_wallsplat) && sprite_index != spr_pizzano_fisthitwall)
		sprite_index = spr_bump;
	if (audio_is_playing(sound_tumble))
		audio_stop_sound(sound_tumble);
	image_speed = 0.35;
}
