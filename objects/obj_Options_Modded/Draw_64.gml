draw_set_halign(fa_center);
draw_set_font(global.font);
draw_option(150, 30, "BACK", optionselected == modded_selected.back);
draw_option(480, 200, "INFINITE LAPS", optionselected == modded_selected.inflap);
draw_option(380, 250, "OFF", !optionsaved_inflap);
draw_option(580, 250, "ON", optionsaved_inflap);
draw_set_font(global.smallfont);
draw_text(480, 512, subtitle);
