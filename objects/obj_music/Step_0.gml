pausedmusic = global.music;
if (global.panic && !obj_pause.pause && room != timesuproom && !global.lap && obj_player.character == characters.pizzelle)
{
	if (!audio_is_playing(mu_escape))
	{
		audio_stop_all_music();
		scr_music(mu_escape);
		pausedmusic = mu_escape;
	}
}
if (global.panic && !obj_pause.pause && room != timesuproom && !global.lap && obj_player.character == characters.pizzano)
{
	if (!audio_is_playing(mu_pizzanoescape))
	{
		audio_stop_all_music();
		scr_music(mu_pizzanoescape);
		pausedmusic = mu_pizzanoescape;
	}
}
if (global.panic && !obj_pause.pause && room != timesuproom && global.lap && global.laps < 4)
{
	if (!audio_is_playing(mu_lap2))
	{
		audio_stop_all_music();
		scr_music(mu_lap2, 11.08, 131.54);
		pausedmusic = mu_lap2;
	}
}
if (global.panic && !obj_pause.pause && room != timesuproom && global.lap && global.laps >= 4)
{
	if (!audio_is_playing(mu_lap5))
	{
		audio_stop_all_music();
		scr_music(mu_lap5, 0.00, 161.5);
		pausedmusic = mu_lap5;
	}
}
else if (!global.panic && room == timesuproom)
	audio_stop_sound(global.music);
if (room != hub_room1 && room != outer_room2)
	fadeoff = audio_sound_get_track_position(global.music) / audio_sound_length(global.music);
else
	fadeoff = 0;
