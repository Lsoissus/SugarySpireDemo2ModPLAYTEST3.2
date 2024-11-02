text_xscale = (960 - 64) / sprite_get_width(spr_tutorialbubble);
wave_timer += 20;
if text_xscale != text_oldxscale
	event_perform(ev_other, ev_room_start);

if showgranny
{
	if voicecooldown > 1
		voicecooldown--;
	else if (!place_meeting(x, y, obj_player))
		voicecooldown = 0;
	if (place_meeting(x, y, obj_player))
	{
		sprite_index = spr_icepoptalk;
		if voicecooldown == 0
		{
			scr_sound(sfx_spicy)
			voicecooldown = 100;
		}
	}
	else
		sprite_index = spr_icepopidle;
}

var _hide = false;

switch text_state
{
	case states.titlescreen:
		repeat _hide + 1
			text_y = Approach(text_y, -(text_sprite_height * text_yscale), 5);
		if (place_meeting(x, y, obj_player) && !_hide)
		{
			text_state = states.bump;
			text_vsp = 0;
		}
		break;
	
	case states.bump:
		text_y += text_vsp;
		if text_vsp < 20
			text_vsp += 0.5;
		if text_y > text_ystart
			text_state = states.normal;
		break;
	
	case states.normal:
		text_y = Approach(text_y, text_ystart, 2);
		if (!place_meeting(x, y, obj_player) || _hide)
			text_state = states.titlescreen;
		break;
}
text_wave_x = Wave(-5, 5, 2, 10, wave_timer);
text_wave_y = Wave(-1, 1, 4, 0, wave_timer);
