with (instance_nearest(x, y, obj_player))
{
	if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == states.jump && sprite_index == spr_player_candyup)
	{
		with (other.id)
			event_user(0);
	}
}
