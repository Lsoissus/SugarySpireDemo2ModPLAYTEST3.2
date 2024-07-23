if (!fadein)
{
	fadealpha = Approach(fadealpha, 1, 0.1);
	if (fadealpha >= 1)
	{
		fadein = true;
		start = true;
		music = false;
		alarm[0] = 240;
	}
}
else
{
	fadealpha = Approach(fadealpha, 0, 0.1);
	if (fadealpha <= 0 && !music && title_music != noone)
	{
		music = true;
		title_music = scr_sound(title_music);
	}
}
if move != sprite_get_width(titlecard_sprite)
	move += 40
	titlecardtitley = lerp(titlecardtitley, 0, 0.075)
titlecardtitlex = lerp(titlecardtitlex, 0, 0.075)
titlecardx = lerp(titlecardtitlex, 0, 0.15)