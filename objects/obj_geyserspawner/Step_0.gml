canActivate = place_meeting(x, y - 1, obj_destructibles) ? false : true;
if (place_meeting(x, y - obj_player.vsp, obj_player) || place_meeting(x, y - 1, obj_player))
{
	if (!instance_exists(SpoutID) && canActivate)
	{
		with (instance_create(x, y, obj_geyservertical))
		{
			scr_sound(sfx_geyser);
			image_xscale = other.image_xscale;
			geysertimer = 300;
			other.SpoutID = id;
		}
	}
}
Imageindex += 0.35;