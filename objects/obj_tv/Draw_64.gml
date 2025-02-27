
if (room != scootercutsceneidk && room != devroom && room != palroom && room != rank_room && room != timesuproom && room != realtitlescreen && room != rm_initializer)
{
	draw_set_font(global.tvfont);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	scr_draw_text_fx(500 + -(string_width(msg) / 2), 475, string_hash_to_newline(msg), c_white, yi, 2);
	if string_starts_with(room_get_name(room), "hub") || string_starts_with(room_get_name(room), "tutorial")
		exit;
	panicline_index += 0.35
	var combo = (global.combotime > 0 && global.combo > 0); 
	if combo
	{
		if (!surface_exists(BarSurface))
			BarSurface = surface_create(sprite_get_width(spr_barpop), sprite_get_height(spr_barpop));
		else
		{
			var ComboFill = (global.combodropped ? spr_barpop2 : spr_barpop2P);

			surface_set_target(BarSurface);
			draw_clear_alpha(c_white, 0);
			ComboY = approach(ComboY, 0, 10);
			meter_image_index += 0.35;
			goo_index += 0.35;
			combo_posX = wave(-5, 5, 2, 20);

			

			comboGooPosition = approach(comboGooPosition, 150 * (global.combotime / 60) + 45, 5)
			draw_sprite(ComboFill, goo_index, comboGooPosition, 200);
			// apply mask
			gpu_set_blendmode(bm_subtract);
			draw_sprite_ext(spr_combomask, 0, 0, 0, 1, 1, 0, c_white, 1);
			gpu_set_blendmode(bm_normal);

			surface_reset_target();
			draw_sprite_ext(spr_barpopback, meter_image_index, 699 + combo_posX, -18 + DrawY + ComboY, 1, 1, 0, c_white, alpha);
			draw_surface_ext(BarSurface, 699 + combo_posX, -18 + DrawY + ComboY, 1, 1, 0, c_white, alpha);
			draw_sprite_ext(spr_barpop, meter_image_index, 699 + combo_posX, -18 + DrawY + ComboY, 1, 1, 0, c_white, alpha);
		}
	}
	
	if combo {
		draw_sprite_ext(spr_tvcombo, image_index, 827 + (combo_posX * 0.6), 112 + DrawY + ComboY, 1, 1, 0, c_white, alpha);
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
			draw_text_color(800 + _xx + (combo_posX * 0.6), 170 + DrawY + ComboY + _yy, string_char_at(_combo, i + 1), c_white, c_white, c_white, c_white, alpha);
		}
	}
	draw_sprite(tvbgsprite, 0, 832, 74 + DrawY)
	pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
	draw_sprite_ext(tvsprite, image_index, 832, 74 + DrawY, 1, 1, 0, c_white, 1);
	if global.panic
        draw_sprite_ext(spr_tv_panicline, panicline_index, 832, 74 + DrawY, 1, 1, 0, c_white, 1)
	if (staticdraw)
		draw_sprite_ext(spr_tvstatic, statictimer, 832, 74 + DrawY, 1, 1, 0, c_white, 1);
	pal_swap_reset();
	if (global.invtv)
		draw_sprite_ext(invsprite, image_index, 700, 57 + DrawY, -1, 1, 0, c_white, 1);
	if ((!combo) && chooseOnecomboend) {
		draw_sprite_ext(comboendSprite, comboendImage, 832, 74, 1, 1, 0, c_white, combofade * alpha);
		ComboY = approach(ComboY, -300, 5);
		meter_image_index = 0;
		goo_index = 0;
	}
}