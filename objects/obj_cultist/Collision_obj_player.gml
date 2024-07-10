with (obj_player) {
	if (state == states.cotton || state == states.cottonroll || state == states.cottondrill)
		state = states.normal;
}
if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	global.collect += 500;
	create_small_number(x, y, "500");
}
global.combotime = 60;
sprite_index = spr_cultist_cast;
alarm[0] = 150;