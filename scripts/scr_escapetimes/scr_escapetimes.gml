function scr_escapetimes(_room = room)
{
	var time_array;
	var seconds = 0;
	var minutes = 0;
	switch (_room)
	{
		case steamy_12:
			minutes = 4;
			seconds = 0;
			break;
		case entryway_11:
			minutes = 3;
			seconds = 0;
			break;
		case molasses_9:
			minutes = 5;
			seconds = 50;
			break;
		case mines_11:
			minutes = 2;
			seconds = 50;
			break;
		case parlornew_5:
			minutes = 1235;
			seconds = 60;
			break;
		default:
			minutes = 0;
			seconds = 10;
			break;
	}
	time_array[0] = minutes;
	time_array[1] = seconds;
	return time_array;
}
