if (ds_list_find_index(global.saveroom, id) == -1)
{
	alarm[0] = 1;
	global.secretsfound += 1
	ds_list_add(global.saveroom, id);
}
panic = false