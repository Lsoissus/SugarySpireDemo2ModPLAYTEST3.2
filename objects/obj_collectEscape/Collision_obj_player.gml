if global.panic
{
    if (global.collectsound == 10)
        audio_play_sound(sfx_escapecollect, 10, false, global.masterVolume or global.soundVolume, 0, random_range(0.3, 2))
    global.collectsound = 0
    global.collect += 10
    global.pizzameter += 1
    create_small_number(x, y, "10");
    if (global.combo >= 1 && global.combotime < 60)
    {
        global.combotime += 4
        global.combofreeze += 2
    }
   with (instance_create(x, y, obj_collectEffect))
{
    sprite_index = other.sprite_index
    choosed = true
}
   instance_destroy()
}
