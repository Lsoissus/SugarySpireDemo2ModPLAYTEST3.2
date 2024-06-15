if (ds_list_find_index(global.baddieroom, id) != -1 && !global.lap)
	instance_destroy();
if (panicEscape)
	state = baddiestates.panic;
