if (global.collectsound == 10)
	scr_sound(sound_points);
global.collectsound = 0;
global.collect += 100;
global.pizzameter += 5;
scr_queue_tvanim(spr_pizzytvhappy, 50);
create_small_number(x, y, "100");
global.combotime = 60;
global.combofreeze = 30;
repeat (5)
	with (instance_create(x + random_range(-32, 32), y + random_range(-32, 32), obj_collectEffect))
	{
		pal_index = irandom_range(1, sprite_get_width(spr_candy_pal))
	}
instance_destroy();
