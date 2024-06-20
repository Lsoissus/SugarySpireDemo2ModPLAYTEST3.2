var _x = x + irandom_range(-1, 1);
var _y = y + irandom_range(-1, 1);

draw_sprite(sprite_index, 0, _x, _y);
draw_set_font(global.lapfont);
draw_text(_x + 40, _y + 30 , string(global.laps + 1));