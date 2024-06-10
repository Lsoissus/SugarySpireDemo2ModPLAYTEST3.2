if (canmove)
{
	scr_getinput();
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected -= 1;
		scr_sound(sound_step);
		optionsaved_invtv = global.invtv;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 1)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_invtv = global.invtv;
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
	}
	if (key_slap2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
	obj_Options_Main.CursorY = CursorY;
}
