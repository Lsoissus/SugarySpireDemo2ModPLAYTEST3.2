function scr_player_Sjumpland()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	machslideAnim = true;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	movespeed = 0;
	start_running = true;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	if (animation_end() && sprite_index != spr_player_superjump_cancelprep)
	{
		sprite_index = spr_player_machfreefall;
		state = states.jump;
		jumpAnim = false;
	}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_superjump_cancelprep)
    {
        movespeed = 14
        state = states.mach3
        sprite_index = spr_player_superjump_cancel
    }
}
