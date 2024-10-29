if (ds_list_find_index(global.saveroom, id) == -1)
{
	global.collect += 3000
    global.combotime = 60
	global.treasurefound = 1
	ds_list_add(global.saveroom, id);
	create_small_number(x + 16,y, 3000)
}