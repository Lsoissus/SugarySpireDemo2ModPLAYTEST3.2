if place_meeting(x, y, obj_secretdestroyable_metal)
    visible = false
if (!(place_meeting(x, y, obj_secretdestroyable_metal)))
    visible = true
if (entered)
{
	obj_player.x = x;
	obj_player.y = y;
	obj_player.image_xscale = clamp(obj_player.image_xscale - 0.05, 0, 1);
	obj_player.image_yscale = clamp(obj_player.image_yscale - 0.05, 0, 1);
}
else if exitedsecret
{
	obj_player.image_xscale = clamp(obj_player.image_xscale + 0.05, 0, 1);
	obj_player.image_yscale = clamp(obj_player.image_yscale + 0.05, 0, 1);	
}