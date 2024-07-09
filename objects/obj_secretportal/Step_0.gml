if disappear
{
    if (image_alpha != 0 && image_xscale != 0 && image_yscale != 0)
    {
        image_alpha -= 0.04
        image_xscale -= 0.04
        image_yscale -= 0.04
    }
}
if place_meeting(x, y, obj_secretdestroyable_metal)
    visible = false
if (!(place_meeting(x, y, obj_secretdestroyable_metal)))
    visible = true
if (entered)
{
	obj_player.x = x;
	obj_player.y = y;
}