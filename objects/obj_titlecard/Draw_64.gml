if (start)
{
	var _xx = -sprite_get_width(titlecard_sprite) + move
	draw_sprite(titlecard_sprite, titlecard_index, _xx, 0);
	var s = 1;
	draw_sprite(title_sprite, title_index, 32 + irandom_range(-s, s), irandom_range(-s, s));
}
if (!instance_exists(obj_fadeout))
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, 10000, 10000, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);