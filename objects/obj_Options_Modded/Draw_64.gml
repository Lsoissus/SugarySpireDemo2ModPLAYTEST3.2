draw_set_halign(fa_center);
draw_set_font(global.font);
draw_option(150, 30, "BACK", optionselected == modded_selected.back);
draw_option(480, 100, "INFINITE LAPS", optionselected == modded_selected.inflap);
draw_option(380, 150, "OFF", !optionsaved_inflap);
draw_option(580, 150, "ON", optionsaved_inflap);
draw_set_font(global.smallfont);
draw_text(480, 512, subtitle);
