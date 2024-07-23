enum option_selected
{
	back,
	audio,
	video,
	input,
	modded,
}
image_speed = 0.35;
CursorX = 0;
CursorY = 0;
bgx = 0;
bgy = 0;
depth = -99;
PauseMusic = -4;
if (room != realtitlescreen)
{
	PauseMusic = scr_soundloop(mu_opinions);
	audio_sound_set_track_position(PauseMusic, global.PAUSEfadeoff);
}
subtitle = "GO BACK TO MAIN SCREEN";
optionselected = option_selected.back;
selected = false;
audio_pause_sound(mu_pause)