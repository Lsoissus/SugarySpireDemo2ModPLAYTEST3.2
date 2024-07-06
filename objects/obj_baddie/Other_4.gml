if (ds_list_find_index(global.baddieroom, id) != -1 || ds_list_find_index(global.escaperoom, id) != -1)
	instance_destroy();
if (panicEscape)
	state = baddiestates.panic;