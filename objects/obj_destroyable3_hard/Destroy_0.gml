if (ds_list_find_index(global.saveroom, id) == -1)
{
	 with (obj_player)
    {
        if ((state == states.handstandjump))
        {
            hsp = ((-xscale) * 4)
            vsp = -4
            mach2 = 0
            image_index = 0
            sprite_index = choose(spr_player_blockbreak1, spr_player_blockbreak2, spr_player_blockbreak3, spr_player_blockbreak4, spr_player_blockbreak5, spr_player_blockbreak6, spr_player_blockbreak7)
            state = states.tackle
        }
    }
    repeat (7)
    {
        with (instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_breakable_debris
    }
    repeat (7)
        instance_create((x + 32), (y + 32), obj_debris)
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigbreakhard_Debris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigbreakhard_Debris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigbreakhard_Debris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigbreakhard_Debris
	if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
	{
		audio_stop_sound(sound_destroyblock1);
		audio_stop_sound(sound_destroyblock2);
	}
	scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
	ds_list_add(global.saveroom, id);
}
