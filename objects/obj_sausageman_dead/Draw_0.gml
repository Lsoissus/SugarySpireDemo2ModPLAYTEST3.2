if sprite_index = spr_juicedead
{
	spr_palette = spr_juicePalette;
	paletteselect = 2;
	var roomname = room_get_name(room);
	switch string_letters(roomname)
	{
		case "entryway": case "entrywaysecret": paletteselect = 1; break;
		case "molasses": case "molassesb": case "molassesc": case "molassesd": case "molassessecret": paletteselect = 3; break;
		case "mines": case "minessecret": paletteselect = 4; break;
		default: paletteselect = 2; break;
	}
	pal_swap_set(spr_palette, paletteselect, false);
	draw_self();
	shader_reset();
}
else
{
	pal_swap_set(spr_palette, paletteselect, false);
	draw_self();
	shader_reset();
}