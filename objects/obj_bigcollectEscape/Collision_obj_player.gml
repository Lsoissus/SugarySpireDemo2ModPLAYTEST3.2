if global.panic
{
    if (global.collectsound == 10)
        audio_play_sound(sfx_escapecollect131, 10, false, global.masterVolume or global.soundVolume, 0, random_range(0.3, 2))
    global.collectsound = 0
	global.collect += 100;
	global.pizzameter += 5;
	scr_queue_tvanim(spr_pizzytvhappy, 50);
	create_small_number(x, y, "100");
	global.combotime = 60;
	global.combofreeze = 30;
     with (instance_create(x, y, obj_collectEffect))
{
    sprite_index = other.sprite_index
    choosed = true
}
	instance_destroy()
}
