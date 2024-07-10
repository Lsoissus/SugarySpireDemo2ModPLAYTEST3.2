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
function iHateYou()
{
    var pos_space, pos_current, text_current, text_output;
    pos_space = -1;
    pos_current = 1;
    text_current = argument0;
    if (is_real(argument2)) argument2 = "#";
    text_output = "";
    while (string_length(text_current) >= pos_current) {
        if (string_width(string_copy(text_current,1,pos_current)) > argument1) {
            //if there is a space in this line then we can break there
            if (pos_space != -1) {
                text_output += string_copy(text_current,1,pos_space) + string(argument2);
                //remove the text we just looked at from the current text string
                text_current = string_copy(text_current,pos_space+1,string_length(text_current)-(pos_space));
                pos_current = 1;
                pos_space = -1;
            } else if (argument3) {
                //if not, we can force line breaks
                text_output += string_copy(text_current,1,pos_current-1) + string(argument2);
                //remove the text we just looked at from the current text string
                text_current = string_copy(text_current,pos_current,string_length(text_current)-(pos_current-1));
                pos_current = 1;
                pos_space = -1;
            }
        }
        pos_current += 1;
        if (string_char_at(text_current,pos_current) == " ") pos_space = pos_current;
    }
    if (string_length(text_current) > 0) text_output += text_current;
    return text_output;
}