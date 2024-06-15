enum modded_selected {
	back,
	invtv,
	inflap,
}
optionselected = modded_selected.back;
ini_open("optionData.ini");
global.invtv = ini_read_real("Settings", "invtv", 0);
global.inflap = ini_read_real("Settings", "inflap", 0);
ini_close();
optionsaved_invtv = global.invtv;
optionsaved_inflap = global.inflap;
subtitle = "GO BACK TO MAIN SCREEN";
CursorY = -999;
depth = -100;
selecting = -1;
obj_Options_Main.CursorY = -999;
canmove = false;
alarm[0] = 1;
