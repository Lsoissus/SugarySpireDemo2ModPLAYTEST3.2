if (sprite_index != spr_confectiboxopen)
{
	var _content = instance_create(x, y, BoxContent);
	if (object_get_parent(_content.object_index) == par_confecti)
	{
		with (instance_create(x,y, obj_explosioneffect))
		{
			sprite_index = spr_taunteffect;
			depth = -2;
		}
		scr_sound(sound_toppingot);
		global.collect += 1000;
		global.combofreeze = 30;
		global.combotime = 60;
	  if ((global.toppintotal < 5))
            global.toppintotal += 1
	}
	image_index = 0
	instance_destroy()
}
