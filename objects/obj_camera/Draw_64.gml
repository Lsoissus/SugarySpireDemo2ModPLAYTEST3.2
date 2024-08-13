var shakeX = irandom_range(-Collectshake, Collectshake);
var shakeY = irandom_range(-Collectshake, Collectshake);
var roomname = room_get_name(room);
if string_starts_with(roomname, "hub") || string_starts_with(room_get_name(room), "parlor")
	exit;

if (room != scootercutsceneidk && room != rm_credits && room != devroom && room != palroom && room != rank_room && room != realtitlescreen)
{
	clock_index += 0.35
/*	if global.heatmeter
	{
	pal_swap_set(spr_heatpal, heatpal, 0);
	draw_sprite_part_ext(spr_heatmeterunder, obj_stylebar.image_index, 0, 0, global.style * 4.25, sprite_get_height(spr_heatmeterunder), -6 + shakeX, 8 + DrawY + shakeY, 1, 1, c_white, 1);
	draw_sprite_ext(spr_heatmeter, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
	}
*/
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
 if ((previousrank != rank_ix))
    {
        previousrank = rank_ix
        rank_scale = 3
    }
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

  var timerx = 480
    var timery = (605 + timer_y)
    var perc = clamp((1 - (target_fill / global.maxwave)), 0, 1)
    var harry_ypos = (-12 * perc)
    var dist = clamp((perc * 268), 0, 268)
    if global.panic
    {
      if (((((global.minutes * 60) + global.seconds) * 60) > 0))
    {
	timer_coneballindex += 0.35
	 tongue_index += 0.35
        if ((timer_coneballindex >= sprite_get_number(coneball_sprite)))
            timer_coneballindex= frac(timer_coneballindex)
        if ((tongue_index >= sprite_get_number(spr_coneball_bartimertonguesup)))
            tongue_index = 0
	}
	else
	{
        if ((coneball_sprite == spr_coneball_bartimer))
        {
            coneball_sprite = spr_coneball_bartimesup
            timer_coneballindex = 0
            timer_buffer = 200
        }
        if ((timer_coneballindex < (sprite_get_number(coneball_sprite) - 1)))
            timer_coneballindex += 0.35
	}
	 target_fill = lerp(target_fill, (((global.minutes * 60) + global.seconds) * 60), 0.03)
        if ((coneball_sprite != spr_coneball_bartimesup))
        {
            draw_sprite_ext(spr_coneball_bartimer, timer_coneballindex, (timerx + 135), (timery - 20), 1, 1, 0, c_white, 1)
            draw_sprite_ext(spr_coneball_bartimertongue, timer_coneballindex, timerx + 7, timery + 3, 1, 1, 0, c_white, 1)
            draw_sprite_part(spr_coneball_bartimer_rolltrail, 0, 0, 0, (dist + 50), 113, (timerx - 182), (timery - 46))
            draw_sprite_ext(spr_coneball_bartimer_roll, roll_index, ((timerx - 140) + dist), ((timery + harry_ypos) + 36), 1, 1, 0, c_white, 1)
            draw_sprite_ext(spr_coneball_bartimerfront, timer_coneballindex, (timerx + 135), (timery - 20), 1, 1, 0, c_white, 1)
        }
        else if ((coneball_sprite == spr_coneball_bartimesup))
            draw_sprite_ext(spr_coneball_bartimertonguesup, floor(timer_coneballindex), timerx, timery, 1, 1, 0, c_white, 1)
        if ((coneball_sprite == spr_coneball_bartimesup))
            draw_sprite_ext(coneball_sprite, floor(timer_coneballindex), (timerx + 135), (timery - 20), 1, 1, 0, c_white, 1)
	var seconds
    if global.seconds < 10
        seconds = concat("0", global.seconds)
    else
        seconds = string(global.seconds)
    draw_set_font(global.numbers)
	var _offset = 0
	if global.minutes < 1
		_offset = random_range(2, -2)
	draw_text(timer_x + 190 + _offset, 605 + timer_y + _offset - (sprite_get_yoffset(spr_font) / 2), concat(global.minutes, ":", seconds))
    draw_sprite(spr_coneball_bartimer_clock, clock_index, timer_x + 142 + _offset, 620 + timer_y + _offset - (sprite_get_yoffset(spr_font) / 2))
}
#endregion