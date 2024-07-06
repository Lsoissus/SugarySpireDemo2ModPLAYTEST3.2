draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
if (global.debugmode)
{
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	draw_text(x, y + 15, 8)
}