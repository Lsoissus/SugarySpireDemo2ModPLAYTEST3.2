if (exited)
{
	obj_player.x = x;
	obj_player.y = y;
	obj_player.image_xscale = clamp(obj_player.image_xscale + 0.05, 0, 1);
	obj_player.image_yscale = clamp(obj_player.image_yscale + 0.05, 0, 1);
}