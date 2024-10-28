global.collect += 25;
global.combofreeze = 30;
global.combotime += 3;
create_small_number(x, y, "25");
audio_stop_sound(sound_points);
audio_sound_pitch(scr_sound(sound_points), random_range(.95, 1.1));
repeat (3)
	instance_create(x + random_range(-5, 5), y + random_range(-5, 5), obj_collecteffect);
instance_destroy();