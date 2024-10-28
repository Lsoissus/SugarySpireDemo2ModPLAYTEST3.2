audio_stop_sound(sound_points);
audio_sound_pitch(scr_sound(sound_points), random_range(.95, 1.1));
global.collect += 100;
global.pizzameter += 5;
scr_queue_tvanim(spr_pizzytvhappy, 50);
create_small_number(x, y, "100");
global.combofreeze = 30;
global.combotime += 5;
repeat (5)
	instance_create(x + random_range(-32, 32), y + random_range(-32, 32), obj_collecteffect);
instance_destroy();