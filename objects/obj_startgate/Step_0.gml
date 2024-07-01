start_parallax = (distance_to_object(obj_player) < 150)
near_gate = (distance_to_object(obj_player) < 50)
if (near_gate)
{
	switch (level)
	{
		default:
			with (obj_tv)
			{
				msg = "PLACEHOLDER";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "entryway":
			with (obj_tv)
			{
				msg = "ENTRYWAY";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "tutorial":
			with (obj_tv)
			{
				msg = "TUTORIAL";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "steamy":
			with (obj_tv)
			{
				msg = "COTTONTOWN";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "unownsteamy":
			with (obj_tv)
			{
				msg = "UNOWNTOWN";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "mines":
			with (obj_tv)
			{
				msg = "SUGARSHACK MINES";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "molasses":
			with (obj_tv)
			{
				msg = "MOLASSES SWAMP";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "timetrial":
			with (obj_tv)
			{
				msg = "TIME TRIAL";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "fudge":
			with (obj_tv)
			{
				msg = "MT FUDGETOP";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "dance":
			with (obj_tv)
			{
				msg = "SEX";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "sucrose":
			with (obj_tv)
			{
				msg = "SUCROSE SNOWSTORM";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "martian":
			with (obj_tv)
			{
				msg = "MARTIAN FREEZER";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "mechanical":
			with (obj_tv)
			{
				msg = "MECHANICAL MADNESS";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "stormy":
			with (obj_tv)
			{
				msg = "COTTONSTORM";
				showtext = true;
				alarm[0] = 2;
			}
			break;
	}
}
