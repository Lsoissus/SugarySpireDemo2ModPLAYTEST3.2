var p1 = tex_max - array_length(tex_list);
var t = (p1) / (tex_max);
var spr_w = sprite_get_width(spr_gummy_cardboard);
var spr_h = sprite_get_height(spr_gummy_cardboard);
var xx = floor((540 / 2) - (spr_w / 2));
var yy = floor((960 / 2) - (spr_h / 2));
draw_sprite_ext(spr_gummy_cardboard, 0, xx, yy, 1, 1, 0, c_grey, 1);
draw_sprite_part(spr_gummy_cardboard, 0, 0, 0, spr_w * t, spr_h, xx, yy);
