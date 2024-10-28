if (exited)
{
	obj_player.x = x;
	obj_player.y = y;
	obj_player.scale_xs = clamp(obj_player.scale_xs + 0.05, 0, 1);
	obj_player.scale_ys = clamp(obj_player.scale_ys + 0.05, 0, 1);
}