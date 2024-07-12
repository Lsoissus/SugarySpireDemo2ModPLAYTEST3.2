/// @description Update NekoPresence so async events will execute.

np_update();

if (ready) {
	// check for game pause
	if (!obj_pause.pause) {
		var roomname = room_get_name(room);
		if (room != realtitlescreen && room != scootercutsceneidk && room != palroom && room != rank_room && !string_starts_with(roomname, "hub") && !string_starts_with(roomname, "outer") && !string_starts_with(roomname, "spire")) {
			var _score = global.collect;
			var _rpcRank = "d";
			if (_score >= global.srank)
				_rpcRank = (scr_isprank() ? "p" : "s");
			else if (_score >= global.arank)
				_rpcRank = "a";
			else if (_score >= global.brank)
				_rpcRank = "b";
			else if (_score >= global.crank)
				_rpcRank = "c";
			state = $"{_score} Points | {global.combo} Combo";
			small_image = $"rank{_rpcRank}";
			small_image_text = $"Rank {string_upper(_rpcRank)}";
		}
		else if (room == rank_room) {
			state = "";
			small_image = $"rank{global.rank}";
			small_image_text = $"Rank {string_upper(global.rank)}";
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