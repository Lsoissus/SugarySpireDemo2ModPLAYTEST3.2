if (global.collectsound == 10)
	scr_sound(sound_points);
global.collectsound = 0;
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
instance_destroy();
