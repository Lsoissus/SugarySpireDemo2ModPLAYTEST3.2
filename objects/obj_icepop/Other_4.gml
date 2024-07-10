text = iHateYou(text, sprite_get_width(bubble_spr) * text_xscale - 7, "\n", false)
text_yscale = (string_height(text) + (text_contentpad * 2)) / text_sprite_height;
if text_yscale < 1
	text_yscale = 1;

if change_y
	text_y = -(text_yscale * text_sprite_height);
else
	change_y = true;

text_oldxscale = text_xscale;
draw_set_font(font);