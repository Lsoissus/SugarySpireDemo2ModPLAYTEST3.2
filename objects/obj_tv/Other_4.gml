var _roomname = room_get_name(room);
// cant use a switch statement because non-constant
// forgive me for writing this coding gods
if string_starts_with(_roomname, "steamy")
{
	tvbgsprite = global.panic ? spr_tvbg_steamy_panic : spr_tvbg_steamy;
}
else if string_starts_with(_roomname, "hub")
{
	tvbgsprite = global.panic ? spr_tvbg_hub : spr_tvbg_hub;
}
else if string_starts_with(_roomname, "entryway")
{
	tvbgsprite = global.panic ? spr_tvbg_wafer_panic : spr_tvbg_wafer;
}
else if string_starts_with(_roomname, "mines")
{
	tvbgsprite = global.panic ? spr_tvbg_mines_panic : spr_tvbg_mines;
}
else if string_starts_with(_roomname, "molasses")
{
	tvbgsprite = global.panic ? spr_tvbg_mlass_panic : spr_tvbg_mlass;
}
else
{ // if the room isnt a level
	tvbgsprite = global.panic ? spr_tvbg_placeholder_panic : spr_tvbg_placeholder;
}
// secret detection
var _letters = string_letters(_roomname);

if string_ends_with(_letters, "secret")
{
	tvbgsprite = spr_tvbg_secret;
}