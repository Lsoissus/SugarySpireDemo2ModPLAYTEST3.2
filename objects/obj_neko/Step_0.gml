/// @description Update NekoPresence so async events will execute.

np_update();

if ready {
	// check if the game isn't paused
	if (!obj_pause.pause)
	{
		// initialize temporary variables
		var _score = global.collect;
		var rpcrank = "D";
		var roomname = room_get_name(room);

		if (room != realtitlescreen && room != scootercutsceneidk && room != palroom && room != rank_room && !string_starts_with(roomname, "hub") && !string_starts_with(roomname, "outer") && !string_starts_with(roomname, "spire")) {
			state = $"{global.collect} Points | {global.combo} Combo";
			if (_score >= global.srank)
				rpcrank = (scr_isprank() ? "P" : "S");
			else if (_score >= global.arank)
				rpcrank = "A";
			else if (_score >= global.brank)
				rpcrank = "B";
			else if (_score >= global.crank)
				rpcrank = "C";
			small_image = $"rank{string_lower(rpcrank)}";
			small_image_text = $"Rank {rpcrank}";
		}
		else if (room == rank_room) {
			state = "";
			small_image = $"rank{string_lower(rpcrank)}";
			small_image_text = $"Rank {rpcrank}";
		}
		else {
			state = "";
			small_image = "";
			small_image_text = "";
		}
	}

	// update neko presence
	np_setpresence_more(small_image_text, large_image_text, false);
	np_setpresence(state, details, large_image, small_image);
}