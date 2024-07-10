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
	obj_player.scale_xs = clamp(obj_player.scale_xs - 0.05, 0, 1);
	obj_player.scale_ys = clamp(obj_player.scale_ys - 0.05, 0, 1);
}
else if exitedsecret
{
	obj_player.scale_xs = clamp(obj_player.scale_xs + 0.05, 0, 1);
	obj_player.scale_ys = clamp(obj_player.scale_ys + 0.05, 0, 1);	
}