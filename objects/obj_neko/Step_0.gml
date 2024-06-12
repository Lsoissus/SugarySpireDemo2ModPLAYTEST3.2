/// @description Update NekoPresence so async events will execute.

np_update();

if ready {
	if (global.collect > global.crank && global.collect < global.brank)
		global.rpcrank = "C";
	else if (global.collect > global.brank && global.collect < global.arank)
		global.rpcrank = "B";
	else if (global.collect > global.arank && global.collect < global.srank)
		global.rpcrank = "A";
	else if (global.collect > global.srank)
		global.rpcrank = "S";
	else if (global.collect < global.crank)
		global.rpcrank = "D";
	if (!obj_pause.pause)
	{
		var roomname = room_get_name(room);
		if (room != realtitlescreen && room != scootercutsceneidk && room != palroom && room != rank_room && !string_starts_with(roomname, "hub") && !string_starts_with(roomname, "outer") && !string_starts_with(roomname, "spire"))
			state = string(global.collect) + " Points | Rank " + string(global.rpcrank);
		else if (room == rank_room)
			state = "Rank " + string(global.rpcrank);
		else
			state = "";
	}
	np_setpresence_more(small_image_text, large_image_text, false);
	np_setpresence(state, details, large_image, small_image);
}
