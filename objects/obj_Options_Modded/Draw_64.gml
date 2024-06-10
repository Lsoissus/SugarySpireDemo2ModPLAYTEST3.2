draw_set_halign(fa_center);
draw_set_font(global.font);
draw_option(150, 30, "BACK", optionselected == modded_selected.back);
draw_option(480, 100, "INVENTORY TV", optionselected == modded_selected.invtv);
draw_option(380, 150, "OFF", !optionsaved_invtv);
draw_option(580, 150, "ON", optionsaved_invtv);
draw_set_font(global.smallfont);
draw_text(480, 512, subtitle);
