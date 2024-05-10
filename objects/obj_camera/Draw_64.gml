var shakeX = irandom_range(-Collectshake, Collectshake);
var shakeY = irandom_range(-Collectshake, Collectshake);
if (room != scootercutsceneidk && room != rm_credits && room != devroom && room != palroom && room != rank_room && room != realtitlescreen)
{
	pal_swap_set(spr_heatpal, heatpal, 0);
	draw_sprite_part_ext(spr_heatmeterunder, obj_stylebar.image_index, 0, 0, global.style * 4.25, sprite_get_height(spr_heatmeterunder), -6 + shakeX, 8 + DrawY + shakeY, 1, 1, c_white, 1);
	draw_sprite_ext(spr_heatmeter, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_cakehud, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
	if (global.collect > global.crank)
		draw_sprite_ext(spr_cranktopping, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
	if (global.collect > global.brank)
		draw_sprite_ext(spr_branktopping, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
	if (global.collect > global.arank)
		draw_sprite_ext(spr_aranktopping, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
	if (global.collect > global.srank)
		draw_sprite_ext(spr_sranktopping, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
	shader_reset();
	draw_set_font(global.collectfont);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	var _string = string(global.collect);
	var _string_length = string_length(_string);
	for (var i = 0; i < _string_length; i++)
	{
		var _xx = 140 + (-(string_width(_string) / 2) + ((string_width(_string) / _string_length) * i));
		var _yyoffset = ((i % 2) == 0) ? -4 : 0;
		draw_text(_xx + shakeX, 29 + obj_stylebar.hudbounce + _yyoffset + DrawY + shakeY, string_char_at(_string, i + 1));
	}
}
draw_set_font(global.font);
draw_set_halign(fa_center);
draw_set_color(c_white);
var _score = global.collect
var rank_ix = 0
if (_score >= global.srank)
{
    rank_ix = 4
}
else if (_score >= global.arank)
    rank_ix = 3
else if (_score >= global.brank)
    rank_ix = 2
else if (_score >= global.crank)
    rank_ix = 1
rank_scale = approach(rank_scale, 1, 0.2)
draw_sprite_ext(spr_ranks_hud, rank_ix, 190, 29, rank_scale, rank_scale, 0, c_white, 1)
var spr_w = sprite_get_width(spr_ranks_hudfill)
var spr_h = sprite_get_height(spr_ranks_hudfill)
var spr_xo = sprite_get_xoffset(spr_ranks_hudfill)
var spr_yo = sprite_get_yoffset(spr_ranks_hudfill)
var perc = 0

switch rank_ix
{
    case 5:
        perc = 1
        break
    case 4:
        perc = 1
        break
    case 3:
        perc = ((_score - global.arank) / (global.srank - global.arank))
        break
    case 2:
        perc = ((_score - global.brank) / (global.arank - global.brank))
        break
    case 1:
        perc = ((_score - global.crank) / (global.brank - global.crank))
        break
    default:
        perc = (_score / global.crank)
}

var t = (spr_h * perc)
var top = (spr_h - t)
draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, top, spr_w, (spr_h - top), (190 - spr_xo), (((29 + obj_stylebar.hudbounce) - spr_yo) + top))
draw_set_halign(fa_center)
draw_set_color(c_white)
if (global.panic || global.starrmode)
{
	if (global.seconds < 10)
	{
		if (global.minutes < 1)
			draw_set_color(c_red);
		else
			draw_set_color(c_white);
		draw_text(random_range(1, -1) + 480, random_range(1, -1) + 65, string_hash_to_newline(string(global.minutes) + ":0" + string(global.seconds)));
	}
	else if (global.seconds >= 10)
	{
		if (global.minutes < 1)
			draw_set_color(c_red);
		else
			draw_set_color(c_white);
		draw_text(random_range(1, -1) + 480, random_range(1, -1) + 65, string_hash_to_newline(string(global.minutes) + ":" + string(global.seconds)));
	}
}
if (global.debugmode)
{
	draw_set_font(global.font);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(260, 450, angle);
	draw_text(325, 450, angledir);
	draw_text(100, 400, obj_player.x);
	draw_text(100, 450, obj_player.y);
	var roomname = string_upper(room_get_name(global.GMLIVE_realroom));
	draw_text(150, 0, roomname);
}
if (global.debugmode)
{
	draw_set_font(font_dev);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text(0, 50, obj_player.state);
	roomname = string_upper(room_get_name(room));
	draw_text(0, 100, roomname);
	var spritename = string_upper(sprite_get_name(obj_player.sprite_index));
	draw_text(0, 150, spritename);
}
