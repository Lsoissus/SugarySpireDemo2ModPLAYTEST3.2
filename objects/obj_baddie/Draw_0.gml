var drawx = x;
var drawy = y;
var xscale = (abs(image_xscale) + squashval) * sign(image_xscale);
var yscale = image_yscale - squashval;
if (object_index == obj_googlyjuice)
{
	var _pal;
	switch (global.levelname)
	{
		case "entryway":
		case "entrywaysecret": _pal = 1; break;
		case "steamy":
		case "steamysecret": _pal = 2; break;
		case "molasses":
		case "molassessecret": _pal = 3; break;
		case "mines":
		case "minessecret": _pal = 4; break;
		default: _pal = 0; break;
	}
	pal_swap_set(spr_juicePalette, _pal, false)
	draw_sprite_ext(sprite_index, image_index, drawx, drawy + (46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha);
	pal_swap_reset()
}
else
	draw_sprite_ext(sprite_index, image_index, drawx, drawy + (46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha);
if (flash)
{
	shader_set(shd_hit);
	draw_sprite_ext(sprite_index, image_index, drawx, drawy + (46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha);
	shader_reset();
}
if (cottoned)
{
	gpu_set_fog(true, 16681727, 1, 1);
	draw_sprite_ext(sprite_index, image_index, drawx, drawy + (46 * squashval), xscale, yscale, image_angle, image_blend, 0.6);
	gpu_set_fog(false, c_white, 0, 0);
}
if (global.debugmode)
{
	draw_set_font(font_dev);
	draw_text(x, y - 50, state);
	draw_text(x, y - 150, movespeed);
	if (object_index == obj_cottonwitch)
		draw_text(x, y - 100, bombreset);
	if (object_index == obj_sluggy)
	{
		draw_text(x, y - 100, idletimer);
		draw_text(x, y - 150, jumptimer);
	}
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}
