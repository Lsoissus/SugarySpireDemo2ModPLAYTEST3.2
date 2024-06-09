if global.panic
{
    if (global.collectsound == 10)
        audio_play_sound(sfx_escapecollect131, 10, false, global.masterVolume or global.soundVolume, 0, random_range(0.3, 2))
    global.collectsound = 0
	global.collect += 100;
	global.pizzameter += 5;
	scr_queue_tvanim(spr_pizzytvhappy, 50);
	create_small_number(x, y, "100");
    if (global.combo >= 1 && global.combotime < 60)
    {
		global.combofreeze = 30;
		global.combotime += 10;
    }
    instance_destroy()
}
