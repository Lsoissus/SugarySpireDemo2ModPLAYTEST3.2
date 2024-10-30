scr_tvsprites();
var roomname = room_get_name(room)
if (room == steamy_1)
{
	global.srank = 23000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (room == entryway_1)
{
	global.srank = 15000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (room == molasses_1)
{
	global.srank = 19000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (room == mines_1)
{
	global.srank = 24000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (showtext)
{
	yi = lerp(yi, 1, 0.2)
}
if (!showtext)
{
	yi = lerp(yi, 0, 0.02)
}
if (!(obj_player.state == states.knightpep && obj_player.state == states.knightpepattack && obj_player.state == states.knightpepslopes))
	once = false;
if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x > ((camera_get_view_width(view_camera[0]) - 350) + obj_camera.Cam_x))
{
	DrawY = lerp(DrawY, -300, 0.15);
	alpha = 0.5;
}
else
{
	DrawY = lerp(DrawY, 0, 0.15);
	alpha = 1;
}
if (global.hurtcounter >= global.hurtmilestone)
{
	var _pChar = "Pizzelle"
	if (obj_player.character == characters.pizzano)
		_pChar = "The Pizzano"
	msg = $"You have hurt {_pChar} {global.hurtmilestone} times...";
	global.hurtmilestone += 10;
	showtext = true;
	alarm[0] = 150;
}
if (obj_player.state == states.keyget)
{
	showtext = true;
	msg = "Got a key!";
	alarm[0] = 50;
}
if (staticdraw)
	statictimer += image_speed;
if (statictimer > 5) {
	staticdraw = false;
	statictimer = 0;
}
if (tvsprite != spr_tvturnon && ds_queue_size(global.newhudtvanim) < 1 && tvlength <= 0)
{
	switch (obj_player.state)
	{
		case states.hurt:
			ChannelState = 0;
			STOREDtvsprite = hurttvspr;
			break;
		case states.minecart:
			ChannelState = 1;
			STOREDtvsprite = minecarttvspr;
			break;
		case states.fireass:
			ChannelState = 2;
			STOREDtvsprite = firetvspr;
			break;
		case states.bombpep:
			ChannelState = 3;
			STOREDtvsprite = bombtvspr;
			break;
		case states.cotton:
		case states.cottondrill:
		case states.cottonroll:
			ChannelState = 4;
			STOREDtvsprite = cottontvspr;
			break;
		case states.mach2:
		case states.machslide:
		case states.climbwall:
		case states.mach3:
			ChannelState = 5;
			if (obj_player.state == states.mach3)
				if obj_player.mach4mode
					STOREDtvsprite = topspeedtvspr;
				else
					STOREDtvsprite = maxspeedtvspr;
			else
				STOREDtvsprite = machtvspr;
			break;
		case states.fling:
			ChannelState = 6;
			STOREDtvsprite = orbtvspr;
			break;
		default:
			ChannelState = 7;
			if (tvsprite != idletvspr && !(tvsprite == tvchange1 || tvsprite == tvchange2))
			{
				if string_pos("secret", string_letters(roomname)) != 0
					STOREDtvsprite = secrettvspr;
				else if global.panic
					STOREDtvsprite = escapetvidle;
				else if global.combo >= 3
				{
					ChannelState = 8;
					STOREDtvsprite = angrytvspr;
				}
				else
				{
					tvcount = choose(500, 450, 400, 550);
					STOREDtvsprite = idletvspr;
					if tvsprite == STOREDtvsprite
						image_index = 0;
				}
			}
			if (tvsprite == idletvspr && tvcount < 1)
			{
				STOREDtvsprite = choose(tvchange1, tvchange2, tvchange2, tvchange1);
				if tvsprite == STOREDtvsprite
					image_index = 0;
			}
			if ((tvsprite == tvchange1 || tvsprite == tvchange2) && animation_end())
			{
				tvcount = choose(500, 450, 400, 550);
				STOREDtvsprite = idletvspr;
				if tvsprite == STOREDtvsprite
					image_index = 0;
			}
			if (tvsprite == idletvspr)
				tvcount--;
			
			break;
	}
	if (OLDChannelState != ChannelState)
	{
		staticdraw = true;
		statictimer = 0;
		OLDChannelState = ChannelState;
	}
	if ((!staticdraw || staticdraw && statictimer >= 5) && tvsprite != STOREDtvsprite)
		tvsprite = STOREDtvsprite;
}
else if (tvsprite != spr_tvturnon && ds_queue_size(global.newhudtvanim) > 1)
{
	tvsprite = ds_queue_dequeue(global.newhudtvanim);
	tvlength = ds_queue_dequeue(global.newhudtvanim);
}
if (tvlength > 0)
{
	ChannelState = 99;
	if (OLDChannelState != ChannelState)
	{
		staticdraw = true;
		statictimer = 0;
		OLDChannelState = ChannelState;
	}
}
tvlength--;
invsprite = (global.key_inv ? spr_invkey : (global.treat ? spr_invdonut : spr_invempty));
if (tvsprite == spr_tvturnon && floor(image_index) == (image_number - 1))
	tvsprite = idletvspr;
sprite_index = tvsprite;
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
var _letters = string_letters(roomname);

if string_ends_with(_letters, "secret")
{
	tvbgsprite = spr_tvbg_secret;
}
