function scr_player_freefallland()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	audio_stop_sound(sfx_groundpoundloop)
	machhitAnim = false;
	movespeed = 0;
	facehurt = true;
	start_running = true;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	if (animation_end())
	{
		state = states.normal;
		sprite_index = spr_idle;
		freefallsmash = false;
	}
	image_speed = 0.35;
}
