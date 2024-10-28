audio_stop_sound(sound_points);
audio_sound_pitch(scr_sound(sound_points), random_range(.95, 1.1));
audio_stop_sound(sound_pizzacoin);
scr_sound(sound_pizzacoin);
scr_queue_tvanim(spr_pizzytvhappy, 200);
global.collect += 1000;
global.pizzameter += 5;
create_small_number(x, y, "1000");
global.combofreeze = 30;
global.combotime = 60;
repeat (15)
	instance_create(x + random_range(-60, 60), y + random_range(-60, 60), obj_collecteffect);
instance_destroy();