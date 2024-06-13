/// @description Initialize Discord.

#macro DISCORD_APP_ID "1250317424604217478"

ready = false;

large_image = "hub";
large_image_text = "";
small_image = "";
small_image_text = "";

state = "";
details = "Titlescreen";

alarm[0] = room_speed * 5;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
	show_error("NekoPresence init fail.", true);