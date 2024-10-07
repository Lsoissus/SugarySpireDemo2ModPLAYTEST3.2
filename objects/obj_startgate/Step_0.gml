start_parallax = (distance_to_object(obj_player) < 150)
near_gate = (distance_to_object(obj_player) < 50)
if (near_gate)
{
	switch (level)
	{
		default:
			with (obj_tv)
			{
				msg = "Placeholder";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "entryway":
			with (obj_tv)
			{
				msg = "Crunchy Construction";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "tutorial":
			with (obj_tv)
			{
				msg = "Tutorial";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "steamy":
			with (obj_tv)
			{
				msg = "Cottontown";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "cafe":
			with (obj_tv)
			{
				msg = "Chocoa Cafe";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "mines":
			with (obj_tv)
			{
				msg = "Sugarshack Mines";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "molasses":
			with (obj_tv)
			{
				msg = "Molasses Swamp";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "timetrial":
			with (obj_tv)
			{
				msg = "Time Trial";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "mountain":
			with (obj_tv)
			{
				msg = "Mt. Fudgetop";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "dance":
			with (obj_tv)
			{
				msg = "Dance-Off";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "sucrose":
			with (obj_tv)
			{
				msg = "Sucrose Snowstorm";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "bee":
			with (obj_tv)
			{
				msg = "Sting Operation";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "mechanical":
			with (obj_tv)
			{
				msg = "Mechanical Madness";
				showtext = true;
				alarm[0] = 2;
			}
			break;
		case "stormy":
			with (obj_tv)
			{
				msg = "Cottonstorm";
				showtext = true;
				alarm[0] = 2;
			}
			break;
	}
}
