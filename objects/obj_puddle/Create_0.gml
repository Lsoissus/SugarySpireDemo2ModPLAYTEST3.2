hsp = 0;
vsp = 0;
grav = 0.5;
image_speed = 0.5;
grounded = false;
sprite_index = spr_juicepuddleair;
mask_index = spr_juicepuddledone;
draw_angle = 0;
vsp = 0.2;
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