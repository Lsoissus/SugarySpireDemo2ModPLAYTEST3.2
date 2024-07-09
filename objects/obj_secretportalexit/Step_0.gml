if disappear
{
    if (image_alpha != 0 && image_xscale != 0 && image_yscale != 0)
    {
        image_alpha -= 0.04
        image_xscale -= 0.04
        image_yscale -= 0.04
    }
}
if (exited)
{
	obj_player.x = x;
	obj_player.y = y;
}
obj_tv.tvsprite = spr_pizzytvsecret;
