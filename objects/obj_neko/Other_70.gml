/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	ready = true;
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more(small_image_text, large_image_text, false);

	//np_setpresence() should ALWAYS come the last!!
	np_setpresence(state, details, large_image, small_image);

	// passing a URL will add this sprite asynchronously via *internets*
	sprite_add(np_get_avatar_url(async_load[? "user_id"], async_load[? "avatar"]), 1, false, false, 0, 0);
}