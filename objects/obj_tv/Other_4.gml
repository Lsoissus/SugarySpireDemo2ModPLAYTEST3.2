/*
var _roomname = room_get_name(room);
switch (global.levelname)
{
	case "steamy":
		tvbgsprite = global.panic ? spr_tvbg_steamy_panic : spr_tvbg_steamy;
		break;
	case "entryway":
		tvbgsprite = global.panic ? spr_tvbg_wafer_panic : spr_tvbg_wafer;
		break;
	case "mines":
		tvbgsprite = global.panic ? spr_tvbg_mines_panic : spr_tvbg_mines;
		break;
	case "molasses":
		tvbgsprite = global.panic ? spr_tvbg_mlass_panic : spr_tvbg_mlass;
		break;
	case "hub":
		tvbgsprite = global.panic ? spr_tvbg_hub : spr_tvbg_hub;
		break;
	default:
		tvbgsprite = global.panic ? spr_tvbg_hub : spr_tvbg_hub;
		break;
}
// secret detection
var _letters = string_letters(_roomname);

if string_ends_with(_letters, "secret")
{
	tvbgsprite = spr_tvbg_secret;
}