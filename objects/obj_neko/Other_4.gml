/// @description Check if the player has entered a new room

if ready {
	// initialize temporary variables
	var roomname = room_get_name(room);
	var rpc_message = (scr_roomnames(room) != "NO ROOMNAME FOUND-1265") ? scr_roomnames(room) : "";

	// hub
	if string_starts_with(roomname, "hub") {
		if (roomname == "hub_world2") {
			large_image = "hub";
			large_image_text = "Hub Room";
			details = "World 2 Hub";
		}
		else {
			large_image = "hub";
			large_image_text = "Hub Room";
			details = "World 1 Hub";
		}
	}

	switch (string_letters(roomname)) {
		// levels
		case "entryway":
			large_image = "crunchy";
			large_image_text = "Crunchy Construction";
			details = rpc_message;
			break;
		case "steamy":
			for (var i = 0; i < 20; i++) {
				if (roomname == ("steamy_" + string(i)) && i < 8) {
					large_image = "cotton";
					large_image_text = "Cottontown";
					details = rpc_message;
				}
				if (roomname == ("steamy_" + string(i)) && i >= 8) {
					large_image = "clock";
					large_image_text = "Cottontown's Clock";
					details = rpc_message;
				}
			}
			break;

		// secrets
		case "entrywaysecret":
			large_image = "crunchysecret"; 
			large_image_text = "Crunchy Construction Secret";
			details = rpc_message;
			break;
		case "steamysecret":
			large_image = "cottonsecret"; 
			large_image_text = "Cottontown Secret";
			details = rpc_message;
			break;
		case "molassessecret":
			large_image = "molassessecret"; 
			large_image_text = "Molasses Swamp Secret";
			details = rpc_message;
			break;
		case "minessecret":
			large_image = "minessecret"; 
			large_image_text = "Sugarshack Mines Secret";
			details = rpc_message;
			break;

		// technical
		case "rankroom":
			large_image = "victory";
			large_image_text = "Rank Screen";
			details = "Sweet Victory";
			break;
	}
	
	// other levels
	if string_starts_with(roomname, "molasses") {
		large_image = "molasses";
		large_image_text = "Molasses Swamp";
		details = rpc_message
	}
	if string_starts_with(roomname, "mines") {
		for (var i = 0; i < 15; i++) {
			if ((roomname == ("mines_" + string(i)) && i < 7) || (roomname == ("mines_" + string(i) + "B") && i < 7)) {
				large_image = "jawbreaker";
				large_image_text = "Jawbreaker Mines";
				details = rpc_message;
			}
			if ((roomname == ("mines_" + string(i)) && i >= 7) || (roomname == ("mines_" + string(i) + "B") && i >= 7)) {
				large_image = "colbalt";
				large_image_text = "Colbalt Caverns";
				details = rpc_message;
			}
		}
	}

	// update neko presence
	np_setpresence_more(small_image_text, large_image_text, false);
	np_setpresence(state, details, large_image, small_image);
}