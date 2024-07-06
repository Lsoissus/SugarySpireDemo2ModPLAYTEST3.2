/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	global.discord_initialized = true;
	ready = true;

	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more(small_image_text, large_image_text, false);
	
    /*
        if this leaks again i told you so

	// initialize temporary variables
	var user_id = async_load[? "user_id"]
	var lockout = true;
	var staff = [
		// developers
		1060255492775084162, // ini
		784009451815567371, // zeph
		1136404769536229457, // scrap hat
		1234176936452821058, // ace
		873313874726764565, // cadmital
		1221898227188633713, // canco
		1091785279075008704, // cookie man
		997939810025082983, // diso456riented
		908054257381572648, // divided
		991995529032634458, // doomgaming2024
		1190496235895918667, // escargado
		985446784119734332, // fizzyplop
		977224713560547368, // gearedguy
		1187127989729771541, // hellobro
		865337740220170240, // internetty
		993148435823874058, // mememan
		1192261172938932367, // spaghette
		1245010164793475105, // the w
		1088741139038871642, // thesillysillysilly
		608514709540569098, // veldao
		
		// playtesters
		676486110465097738, // low bo
		710517510218186843, // afrozenclover
		1100223613283598386, // luna
		958084660083183647, // wizzerlytheknarly
		983028403986903050, // eggythefriedegg
	]
        

	// validate if the current userid matches one on the staff
	for(var i = 0; i < array_length(staff); i++) {
	    if user_id == string(staff[i])
	       lockout = false;
	}

	// if validation failed
	if (lockout)
		show_error("teacher! teacher! someone tried to leak the mod!", true);*/

	//np_setpresence() should ALWAYS come the last!!
	np_setpresence(state, details, large_image, small_image);
	
	// passing a URL will add this sprite asynchronously via *internets*
	sprite_add(np_get_avatar_url(async_load[? "user_id"], async_load[? "avatar"]), 1, false, false, 0, 0);
}