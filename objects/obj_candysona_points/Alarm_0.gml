collect -= 10
global.collect += 10
global.combotime += 10
scr_sound(sound_points)
if (collect > 0)
    alarm[0] = 5
else
    instance_destroy()
