ds_list_add(global.saveroom, id);
global.janitor = true;
scr_sound(sound_toppingot);
global.combotime = 60;
instance_create(x, y, obj_rudejanito);
instance_create(x, y, obj_confectitaunt);
instance_destroy();