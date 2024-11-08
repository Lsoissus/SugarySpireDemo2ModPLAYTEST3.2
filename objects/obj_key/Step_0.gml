if (vsp < 12)
	vsp += grav;
if (inv_frame)
	image_alpha = 0.5;
if (!inv_frame)
	image_alpha = 1;
scr_collide();
if (sprite_index == spr_spookey_intro && floor(image_index) == (image_number - 1))
{
    instance_create(x, y, obj_spookeymove)
    ds_list_add(global.saveroom, id)
    instance_destroy()
    global.combotime = 60
    global.key_inv = 1
}
