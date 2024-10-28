audio_stop_sound(sound_points);
audio_sound_pitch(scr_sound(sound_points), random_range(.95, 1.1));
global.collect += 1000000000000000000000000000000000000000000000000000000000000000000000000000000000;
global.pizzameter += 1;
create_small_number(x, y, "10");
global.combofreeze = 30;
instance_destroy();
