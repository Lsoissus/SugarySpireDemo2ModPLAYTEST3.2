live_auto_call;
if (room != scootercutsceneidk && room != devroom && room != palroom && room != rank_room && room != timesuproom && room != realtitlescreen)
{
	if (global.combotime > 0 && global.combo > 0)
	{
		if (!surface_exists(BarSurface))
			BarSurface = surface_create(sprite_get_width(spr_barpop), sprite_get_height(spr_barpop));
		else
		{
			var ComboFill = (global.combodropped ? spr_barpop2 : spr_barpop2P);
			var ComboEnd = (global.combodropped ? spr_barpop3 : spr_barpop3P);

			surface_set_target(BarSurface);
			draw_clear_alpha(c_white, 0);
			draw_sprite_tiled(ComboFill, 0, 230 * (global.combotime / 60) + 40, 180);

			ComboY = lerp(ComboY, 0, 0.15);
			
			gpu_set_blendmode(bm_subtract);
			draw_set_color(c_black);
			draw_rectangle(230 * (global.combotime / 60) + 40, 180, 200, 230, false);
			draw_set_color(c_white);
			draw_sprite_ext(spr_combomask, 0, 0, 0, 1, 1, 0, c_white, 1);
			gpu_set_blendmode(bm_normal);
			draw_sprite_ext(ComboEnd, 0, 230 * (global.combotime / 60) + 40, 180, 1, 5, 0, c_white, 1);
			// since im a lazy fuck lets mask again for the foam at the end
			gpu_set_blendmode(bm_subtract);
			draw_sprite_ext(spr_combomask, 0, 0, 0, 1, 1, 0, c_white, 1);
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
			draw_surface_ext(BarSurface, 699, -18 + DrawY + ComboY, 1, 1, 0, c_white, alpha);
		}
	}
	draw_sprite_ext(spr_barpop, 0, 699, -18 + DrawY + ComboY, 1, 1, 0, c_white, alpha);
	draw_sprite(tvbgsprite, 0, 832, 74 + DrawY)
	pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
	draw_sprite_ext(tvsprite, image_index, 832, 74 + DrawY, 1, 1, 0, c_white, 1);
	if (staticdraw)
		draw_sprite_ext(spr_tvstatic, statictimer, 832, 74 + DrawY, 1, 1, 0, c_white, 1);
	pal_swap_reset();
	if (global.invtv)
		draw_sprite_ext(invsprite, image_index, 700, 57 + DrawY, -1, 1, 0, c_white, 1);
	draw_set_font(global.font);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(xi, yi, string_hash_to_newline(message));
	if (global.combotime > 0 && global.combo > 0)
	{
		draw_sprite_ext(spr_tvcombo, image_index, 827, 112+ DrawY + ComboY, 1, 1, 0, c_white, alpha);
		draw_set_font(global.combofont);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		var _combo = string(global.combo);
		var _string_length = string_length(_combo);
		for (var i = 0; i < _string_length; i++)
		{
			var _xx = -(string_width(_combo) / 2) + ((string_width(_combo) / _string_length) * i);
			var _yy = i * -4;
			if (ComboShake)
			{
				_xx += irandom_range(-2, 2);
				_yy += irandom_range(-2, 2);
			}
			draw_text_color(800 + _xx, 170 + DrawY + ComboY + _yy, string_char_at(_combo, i + 1), c_white, c_white, c_white, c_white, alpha);
		}
	}
	else if (chooseOnecomboend) {
		draw_sprite_ext(comboendSprite, comboendImage, 832, 74, 1, 1, 0, c_white, combofade * alpha);
		ComboY = lerp(ComboY, -300, 0.15);
	}
}