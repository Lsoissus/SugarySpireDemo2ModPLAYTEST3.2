/// @description Check what room the player's in

if ready {
	var roomname = room_get_name(room);
	var rpc_message = (scr_roomnames(room) != "NO ROOMNAME FOUND-1265") ? scr_roomnames(room) : "";
	if string_starts_with(roomname, "hub") {
		if roomname == "hub_room2" {
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
	switch (global.levelname)
	{
		case "entryway":
			large_image = "crunchy";
			large_image_text = "Crunchy Construction";
			details = rpc_message;
			break;
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
		case "rank":
			large_image = "victory";
			large_image_text = "Rank Screen";
			break;
		case "molasses":
			large_image = "molasses"; 
			large_image_text = "Molasses Swamp";
			details = rpc_message;
			break;
		case "steamy":
			large_image = "cotton";
			large_image_text = "Cottontown";
			details = rpc_message;
			break;
		case "mines":
			large_image = "jawbreaker";
			large_image_text = "Jawbreaker Mines";
			details = rpc_message;
			break;
	}
	if (string_letters(roomname) == "steamy")
	{
		for (var i = 0; i < 20; i++)
		{
			if (roomname == ("steamy_" + string(i)) && i >= 8)
			{
				large_image = "clock";
				large_image_text = "Cottontown's Clock";
				details = rpc_message;
			}
		}
	}
	if (string_letters(roomname) == "mines" || string_letters(roomname) == "minesB")
	{
		for (var i = 0; i < 15; i++)
		{
			if ((roomname == ("mines_" + string(i)) && i >= 7) || (roomname == ("mines_" + string(i) + "B") && i < 7))
			{
				large_image = "colbalt";
				large_image_text = "Colbalt Caverns";
				details = rpc_message;
			}
		}
	}
	np_setpresence_more(small_image_text, large_image_text, false);
	np_setpresence(state, details, large_image, small_image);
}