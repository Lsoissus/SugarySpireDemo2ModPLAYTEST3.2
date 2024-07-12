var shakeX = irandom_range(-Collectshake, Collectshake);
var shakeY = irandom_range(-Collectshake, Collectshake);
var roomname = room_get_name(room);
if string_starts_with(roomname, "hub") || string_starts_with(room_get_name(room), "parlor")
	exit;

if (room != scootercutsceneidk && room != rm_credits && room != devroom && room != palroom && room != rank_room && room != realtitlescreen)
{
	if global.heatmeter
	{
	pal_swap_set(spr_heatpal, heatpal, 0);
	draw_sprite_part_ext(spr_heatmeterunder, obj_stylebar.image_index, 0, 0, global.style * 4.25, sprite_get_height(spr_heatmeterunder), -6 + shakeX, 8 + DrawY + shakeY, 1, 1, c_white, 1);
	draw_sprite_ext(spr_heatmeter, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
	}
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
	if old_collect != global.collect
	{
		// cycle through array and change the colors
	    for (var i = 0; i < _string_length; i++)
	        color_array[i] = irandom_range(1, pal_width);
		// update the old_collect var so it only runs when global.collect changes
	    old_collect = global.collect
	}
	for (var l = 0; l < _string_length; l++)
	{
		// funny math that im too tired to understand rn
		var _xx = 150 + -(string_width(_string) / 2) + ((string_width(_string) / _string_length) * l);
		var _yyoffset = (l % 2) == 0 ? -4 : 0;
		// palette one character
		pal = color_array[l]
		pal_swap_set(spr_fontcollect_pal, pal, 0);
		// draw one character
		draw_text((_xx + shakeX), ((((29 + obj_stylebar.hudbounce) + _yyoffset) + DrawY) + shakeY), string_char_at(_string, (l + 1)))
		pal_swap_reset();
	}
	if (!string_starts_with(roomname, "hub") && !string_starts_with(roomname, "outer") && !string_starts_with(roomname, "spire")) {
		draw_set_font(global.font);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		var _score = global.collect
		var rank_ix = 0
		if (_score >= global.srank)
			rank_ix = (scr_isprank() ? 5 : 4);
		else if (_score >= global.arank)
		    rank_ix = 3
		else if (_score >= global.brank)
			rank_ix = 2
		else if (_score >= global.crank)
			rank_ix = 1
		rank_scale = approach(rank_scale, 1, 0.2)
		var rank_xpos = 217 // 190
		var rank_ypos = 23 // 29
		draw_sprite_ext(spr_ranks_hud, rank_ix, rank_xpos, rank_ypos + DrawY, rank_scale, rank_scale, 0, c_white, 1)
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
		draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, top, spr_w, (spr_h - top), ((rank_xpos) - spr_xo), ((rank_ypos + DrawY) - spr_yo) + top)
		draw_set_halign(fa_center)
		draw_set_color(c_white)
	}
}
/*if (global.panic)
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
}*/
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

#region BAR TIMER

if global.panic
{
    var _fill = (global.minutes * 60 + global.seconds) * 60
    var _currentbarpos = chunkmax - _fill
    var _perc = _currentbarpos / chunkmax
    var _max_x = cam_w / 2 - 200
    var _barpos = _max_x * _perc
    var timerspr = coneball_sprite
    draw_sprite(timerspr, coneball_index, timer_x + 280, timer_y + 10)
	draw_sprite(spr_coneball_bartimertongue, -1, timer_x, timer_y)
    if !surface_exists(bar_surface)
        bar_surface = surface_create(cam_w / 2, 30)
    var _barfillpos = floor(_barpos) + 13
    if _barfillpos > 0
    {
        surface_resize(bar_surface, _barfillpos, 30)
        surface_set_target(bar_surface)
        draw_clear_alpha(c_black, 0)
        var clip_x = timer_x + 3
        var clip_y = timer_y + 5
        draw_sprite(spr_coneball_bartimer_rolltrail, 0, timer_x, 0)
        surface_reset_target()
        draw_surface(bar_surface, timer_x, timer_y)
    }
    draw_sprite(roll_sprite, roll_index, timer_x + 13 + _barpos, timer_y + 20)
	var seconds
    if global.seconds < 10
        seconds = concat("0", global.seconds)
    else
        seconds = string(global.seconds)
    draw_set_font(global.numbers)
	var _offset = 0
	if global.minutes < 1
		_offset = random_range(2, -2)
	draw_text(timer_x + 200 + _offset, timer_y + 18 + _offset - (sprite_get_yoffset(spr_font) / 2), concat(global.minutes, ":", seconds))
}
else if surface_exists(bar_surface)
    surface_free(bar_surface)
	
#endregion