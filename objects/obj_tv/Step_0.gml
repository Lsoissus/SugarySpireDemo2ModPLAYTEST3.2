scr_tvsprites();
if (room == steamy_1)
{
	global.srank = 10000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (room == entryway_1)
{
	global.srank = 8000;
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
	xi = 500 + random_range(1, -1);
	if (yi > 475)
		yi -= 5;
}
if (!showtext)
{
	xi = 500 + random_range(1, -1);
	if (yi < 675)
		yi += 1;
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
if (global.collect > global.arank && !shownranka)
{
	msg = "YOU GOT ENOUGH FOR RANK A";
	showtext = true;
	alarm[0] = 200;
	shownranka = true;
}
else if (global.collect > global.brank && !shownrankb)
{
	msg = "YOU GOT ENOUGH FOR RANK B";
	showtext = true;
	alarm[0] = 200;
	shownrankb = true;
}
else if (global.collect > global.crank && !shownrankc)
{
	msg = "YOU GOT ENOUGH FOR RANK C";
	showtext = true;
	alarm[0] = 200;
	shownrankc = true;
}
if (global.hurtcounter >= global.hurtmilestone)
{
	var _pChar = "PIZZELLE"
	if (obj_player.character == characters.pizzano)
		_pChar = "THE PIZZANO"
	msg = $"YOU HAVE HURT {_pChar} {global.hurtmilestone} TIMES...";
	global.hurtmilestone += 10;
	showtext = true;
	alarm[0] = 150;
}
if (obj_player.state == states.keyget)
{
	showtext = true;
	msg = "KEY OBTAINED!";
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
		if (!instance_exists(obj_secretfound))
        {
			if (!obj_player.angry)
			{
				ChannelState = 7;
				if (tvsprite != idletvspr && !(tvsprite == tvchange1 || tvsprite == tvchange2))
				{
					if global.panic
						STOREDtvsprite = escapetvidle;
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
			}
			else
			{
				ChannelState = 8;
				STOREDtvsprite = angrytvspr;
			}
		}
		else
			STOREDtvsprite = secrettvspr;		
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

