if (canmove)
{
	scr_getinput();
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected -= 1;
		scr_sound(sound_step);
		optionsaved_invtv = global.invtv;
		optionsaved_inflap = global.inflap;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 2)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_invtv = global.invtv;
		optionsaved_inflap = global.inflap;
	}
	switch (optionselected)
	{
		case modded_selected.back:
			subtitle = "GO BACK TO MAIN SCREEN";
			CursorY = -999;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				instance_destroy();
			}
			break;
		case modded_selected.invtv:
			subtitle = "TOGGLE INVENTORY TV";
			CursorY = 100;
			optionsaved_invtv += (key_right2 + key_left2);
			optionsaved_invtv = wrap(optionsaved_invtv, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "invtv", optionsaved_invtv);
				ini_close();
				global.invtv = optionsaved_invtv;
			}
			break;
		case modded_selected.inflap:
			subtitle = "TOGGLE INFINITE LAPS";
			CursorY = 200;
			optionsaved_inflap += (key_right2 + key_left2);
			optionsaved_inflap = wrap(optionsaved_inflap, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "inflap", optionsaved_inflap);
				ini_close();
				global.inflap = optionsaved_inflap;
			}
			break;
	}
	if (key_slap2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
	obj_Options_Main.CursorY = CursorY;
}
