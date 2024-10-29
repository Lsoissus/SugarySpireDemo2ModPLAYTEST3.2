/// @description Insert description here
// You can write your code in this editor
ds_list_add(global.saveroom, id);
global.lapjanitor = true;
scr_sound(sound_toppingot);
global.combotime = 60;
instance_create(x, y, obj_lapjanitor);
instance_create(x, y, obj_confectitaunt);
instance_destroy();







