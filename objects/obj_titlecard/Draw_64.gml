if (start)
{
	draw_sprite(titlecard_sprite, titlecard_index, titlecardx, 0);
	var s = 1;
	draw_sprite(title_sprite, title_index, titlecardtitlex, titlecardtitley + bobbingtitle);
}
if (!instance_exists(obj_fadeout))
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, 10000, 10000, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
bobbingtitle = wave(3, -3, 2, 0)