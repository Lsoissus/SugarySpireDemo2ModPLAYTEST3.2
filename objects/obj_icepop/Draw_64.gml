if (text_state == states.titlescreen && text_y <= -(text_sprite_height * text_yscale))
	exit;
gpu_set_blendmode(bm_normal)
var xx = text_borderpad + text_wave_x;
var yy = text_y + text_wave_y;
tex_x -= 0.5;
draw_sprite(spr_propeller, -1, xx, yy - 19)
draw_sprite(spr_propeller, -1, xx + 856, yy - 19)
scr_draw_granny_texture(xx, yy, text_xscale, text_yscale, tex_x, tex_x, background_spr, bubble_spr);
draw_sprite_ext(bubble_spr, 1, xx, yy, text_xscale, text_yscale, 0, c_white, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font);
draw_set_color(text_color);
scr_draw_text_fx(xx + text_contentpad, yy + text_contentpad, text, text_color, 1, 2, 
{
	offset: 1
});
