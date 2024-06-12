/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	global.discord_initialized = true;
	ready = true;
	
	// passing a URL will add this sprite asynchronously via *internets*
	sprite_add(np_get_avatar_url(async_load[? "user_id"], async_load[? "avatar"]), 1, false, false, 0, 0);
}