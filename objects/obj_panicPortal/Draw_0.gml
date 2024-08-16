draw_self();
scale = image_index / 8;
color = make_color_hsv(0, 0, scale * 255);
if (floor(image_index) < 8)
{
if drawSprite = spr_juicewalk
{
var spr_palette = spr_juicePalette;
var paletteselect = 2;
var roomname = room_get_name(room);
switch string_letters(roomname)
{
	case "entryway": case "entrywaysecret": paletteselect = 1; break;
	case "molasses": case "molassesb": case "molassesc": case "molassesd": case "molassessecret": paletteselect = 3; break;
	case "mines": case "minessecret": paletteselect = 4; break;
	default: paletteselect = 2; break;
}
pal_swap_set(spr_palette, paletteselect, false);
draw_sprite_ext(drawSprite, -1, x, y, scale * sign(drawXscale), scale, image_angle, color, image_alpha);
shader_reset();
}
else
draw_sprite_ext(drawSprite, -1, x, y, scale * sign(drawXscale), scale, image_angle, color, image_alpha);
}