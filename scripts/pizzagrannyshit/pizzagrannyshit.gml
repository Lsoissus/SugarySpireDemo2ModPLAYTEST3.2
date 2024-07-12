function Approach(a, b, amount)
{
	if a < b
	{
		a += amount;
		if a > b
			return b;
	}
	else
	{
		a -= amount;
		if a < b
			return b;
	}
	return a;
}

function Wave(from, to, duration, offset, time = noone)
{
	var a4 = (to - from) * 0.5;
	
	var t = current_time;
	if time != noone
		t = time;
	
	return from + a4 + (sin((((t * 0.001) + (duration * offset)) / duration) * (pi * 2)) * a4);
}

function scr_draw_granny_texture(x, y, xscale, yscale, tex_x, tex_y, sprite = spr_icepopdia, bubble_sprite = spr_textbox)
{
	var w = sprite_get_width(bubble_sprite) * xscale;
	var h = sprite_get_height(bubble_sprite) * yscale;
	
	if (!surface_exists(surfclip))
		surfclip = surface_create(w, h);
	if (!surface_exists(surffinal))
		surffinal = surface_create(w, h);
	
	surface_set_target(surfclip);
	draw_clear_alpha(0, 0);
	draw_rectangle_color(0, 0, w, h, c_white, c_white, c_white, c_white, false);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(bubble_sprite, 0, 0, 0, xscale, yscale, 0, c_white, 1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	surface_set_target(surffinal);
	draw_sprite_tiled(sprite, 0, tex_x, tex_y);
	gpu_set_blendmode(bm_subtract);
	draw_surface(surfclip, 0, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	draw_surface(surffinal, x, y);
}
function scr_string_width(str)
{
	var pos = 0;
	var w = 0;
	var originalstr = str;
	var str_arr = array_create(0);
	while (pos < string_length(originalstr))
	{
		if (string_copy(originalstr, pos, 2) == "\n")
		{
			array_push(str_arr, string_copy(originalstr, 1, pos));
			string_delete(originalstr, 1, pos);
			pos = 0;
			if originalstr == ""
				break;
			continue;
		}
		pos++;
	}
	if (array_length(str_arr) == 0)
		w = string_width(str);
	for (var i = 0; i < array_length(str_arr); i++)
	{
		var b = str_arr[i];
		if (string_width(b) > w)
			w = string_width(b);
	}
	return w;
}
function scr_is_separation(char, separation)
{
	for (var i = 0; i < array_length(separation); i++)
	{
		if char == separation[i]
			return true;
	}
	return false;
}
function scr_separate_text(str, font, width)
{
	if font != noone
		draw_set_font(font);
	
	var separation = " "
	separation = string_split(separation, ",");
	
	while (string_width(str) > width - string_width("a"))
	{
		var _pos = string_length(str);
		var _oldpos = _pos;
		while (!scr_is_separation(string_char_at(str, _pos), separation))
		{
			_pos--;
			if _pos < 0
				_pos = _oldpos;
		}
		if (string_char_at(str, _pos) == " ")
		{
			str = string_delete(str, _pos, 1);
			str = string_insert("\n", str, _pos);
		}
		else
			str = string_insert("\n", str, _pos + 1);
	}
	return str;
}

function scr_draw_text_fx(x, y, text, color = c_white, alpha = 1, effect = 0, option_struct = noone)
{
	var cx = x
	var cy = y;
	var shit = false
	
	for (var i = 0; i < string_length(text); i++)
	{
		var b = string_char_at(text, i + 1)
		
		if b == ansi_char(10)
		{
			cy += string_height("a");
			cx = x;
			shit = true;
			continue;
		}
		
		shit = false
		
		if effect == 0
				draw_text_color(cx, cy, b, color, color, color, color, alpha);
		else
		{
			switch effect
			{
				case 1:

						var s1 = irandom_range(-1, 1);
						var s2 = irandom_range(-1, 1);
							draw_text_color(cx + s1, cy + s2, b, color, color, color, color, alpha);
					break;
						
				case 2:
						var s = 0;
						var o = 1;
						if option_struct != noone
							o = option_struct.offset;
						var d = ((i % 2) == 0) ? -1 : 1;
						var _dir = floor(Wave(-1, 1, 0.1, 0));
						s += (_dir * d * o);
						draw_text_color(cx, cy + s, b, color, color, color, color, alpha);
					break;
			}
		}
		cx += scr_string_width(b);
	}
}