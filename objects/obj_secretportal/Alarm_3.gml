sprite_index = spr_secretportal_spawnidle
if (ds_list_find_index(global.saveroom, id) == -1)
    ds_list_add(global.saveroom, id)
alarm[4] = 90
