card_index += 0.35
if !rankreview
{
var _bgIndex = 1;
switch global.rank {
	case "p": _bgIndex = 0; palettechoose = 0;
	break;
	case "s": _bgIndex = 5; palettechoose = 5;
	break;
	case "a": _bgIndex = 4; palettechoose = 4;
	break;
	case "b": _bgIndex = 3; palettechoose = 3;
	break;
	case "c": _bgIndex = 2; palettechoose = 2;
	break;
	case "d": _bgIndex = 1; palettechoose = 1;
	break;
}
draw_set_color(c_white);
draw_set_alpha(bgalpha)
pal_swap_set(spr_bg_rankspal, palettechoose, 0);
draw_sprite_tiled(spr_bg_ranks, _bgIndex, 0 - val, 0 + val)
shader_reset()
draw_set_alpha(1)
pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
draw_set_alpha(whiteflashAlpha)
draw_rectangle(-64, -64, camera_get_view_width(view_camera[0]) + 64, camera_get_view_height(view_camera[0]) + 64, false);
whiteflashAlpha = lerp(whiteflashAlpha, 0, 0.2)
draw_set_alpha(image_alpha)
}
else
{
var _cakeIndex = 1;
switch global.rank {
	case "p": _cakeIndex = 0;
	break;
	case "s": _cakeIndex = 0;
	break;
	case "a": _cakeIndex = 1;
	break;
	case "b": _cakeIndex = 2;
	break;
	case "c": _cakeIndex = 3;
	break;
	case "d": _cakeIndex = 4;
	break;
}
shader_set(shd_rank)
var dark = shader_get_uniform(shd_rank, "u_dark")
var light = shader_get_uniform(shd_rank, "u_light")
shader_set_uniform_f_array(dark, freezecol.dark)
shader_set_uniform_f_array(light, freezecol.light)
draw_set_color(c_white);
draw_rectangle(-64, -64, camera_get_view_width(view_camera[0]) + 64, camera_get_view_height(view_camera[0]) + 64, false);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();	
draw_sprite(spr_clipboardrank, 0, 455, clipboardPos)
draw_sprite(spr_rank_cakescores, _cakeIndex, 455 + 245, clipboardPos + 476)
draw_set_font(global.resultsfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
var _string = string(global.collect);
var _string_length = string_length(_string);
for (var l = 0; l < _string_length; l++)
{
	// funny math that im too tired to understand rn
	var _xx = 455 + 260 + -(string_width(_string) / 2) + ((string_width(_string) / _string_length) * l);
	var _yyoffset = (l % 2) == 0 ? -4 : 0;
	// palette one character
	pal = color_array[l]
	pal_swap_set(spr_fontcollect_pal, pal, 0);
	// draw one character
	draw_text(_xx, clipboardPos + 385 + height_array[l] + _yyoffset, string_char_at(_string, (l + 1)))
	pal_swap_reset();
}
for (l = 0; l < 3; l++)
{
	var _xx = 455 + 170 + (75 * l)
	if !variable_global_get("secretfound" + string(l + 1))
	draw_sprite(spr_rankcard, card_index, _xx, clipboardPos + 325)
	else
	draw_sprite(spr_rankcardflipped, card_index, _xx, clipboardPos + 325)
	
}
for (l = 0; l < 5; l++)
{
	var _followvar = variable_global_get(confectiArray[l] + "follow")
	var index = asset_get_index($"spr_rank_{confectiArray[l] + (_followvar ? "" : "_lose")}")
	var _xx = 455 + 80 + (80 * l)
	draw_sprite(index, sprite_get_number(index) - 1, _xx, clipboardPos + 230)
	
}
draw_set_font(global.combofontresults)
draw_text(795, clipboardPos + 70, string(global.maxcombo))
switch global.rank {
	case "p": _cakeIndex = 0;
	break;
	case "s": _cakeIndex = 1;
	break;
	case "a": _cakeIndex = 2;
	break;
	case "b": _cakeIndex = 3;
	break;
	case "c": _cakeIndex = 4;
	break;
	case "d": _cakeIndex = 5;
	break;
}
draw_sprite(spr_rank_image, _cakeIndex, 695, clipboardPos + 110)
if global.treasurefound
	draw_sprite(spr_rudejanitorgot, 0, 575, clipboardPos + 120)
draw_set_alpha(whiteflashAlpha)
draw_rectangle(-64, -64, camera_get_view_width(view_camera[0]) + 64, camera_get_view_height(view_camera[0]) + 64, false);
clipboardPos = lerp(clipboardPos, 2, 0.1)
whiteflashAlpha = lerp(whiteflashAlpha, 0, 0.2)
x = lerp(x, targetx, 0.1)
draw_set_alpha(image_alpha)
}
