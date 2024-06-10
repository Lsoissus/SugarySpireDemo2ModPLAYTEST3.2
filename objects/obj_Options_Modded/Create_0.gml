enum modded_selected {
	back,
	invtv,
}
optionselected = modded_selected.back;
ini_open("optionData.ini");
global.invtv = ini_read_real("Settings", "invtv", 1);
ini_close();
optionsaved_invtv = global.invtv;
subtitle = "GO BACK TO MAIN SCREEN";
CursorY = -999;
depth = -100;
selecting = -1;
obj_Options_Main.CursorY = -999;
canmove = false;
alarm[0] = 1;
