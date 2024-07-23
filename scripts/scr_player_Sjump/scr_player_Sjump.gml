function scr_player_Sjump()
{
	if (character == characters.pizzelle || sprite_index != spr_pizzano_sjump)
		hsp = 0;
	else if (character == characters.pizzano && sprite_index == spr_pizzano_sjump)
		hsp = move * 3;
	Sjumpcan_doublejump = false;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	move = key_left + key_right;
	if (move != 0)
		xscale = move;
	if (sprite_index == spr_player_superjump || sprite_index == spr_pizzano_sjump)
	{
		vsp = -movespeed;
		movespeed = approach(movespeed, 18, 1);
	}
	if (sprite_index == spr_pizzano_sjumpprep)
		vsp = 0;
	if (sprite_index == spr_pizzano_sjumpprep && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_pizzano_sjump;
		vsp = -10;
	}
	if (scr_solid(x, y + vsp) && !place_meeting(x, y + vsp, obj_boxofpizza) && !place_meeting(x, y + vsp, obj_metalblock) && !place_meeting(x, y + vsp, obj_destructibles))
	{
		scr_sound(sound_maximumspeedland);
		sprite_index = spr_player_superjumpland;
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with (obj_baddie)
		{
			if (point_in_camera(x, y, view_camera[0]) && grounded)
			{
				image_index = 0;
				state = baddiestates.idle;
				vsp = -7;
				hsp = 0;
			}
		}
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = false;
		movespeed = 0;
	}
	image_speed = 0.5;
	if ((key_attack2 || key_slap2) && !grounded && vsp < -10 && character == characters.pizzelle)
	{
        sprite_index = spr_player_superjump_cancelprep
        vsp = 0
        scr_sound(sound_superjumpcancel)
	}
	if sprite_index == spr_player_superjump_cancelprep
		vsp = 0
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_superjump_cancelprep)
    {
        movespeed = 14
        state = states.mach3
        sprite_index = spr_player_superjump_cancel
    }
	if (key_slap2 && !grounded && vsp < -10 && character == characters.pizzano)
	{
		flash = true;
		charged = false;
		sprite_index = spr_pizzano_sjumpprepside;
		image_index = 0;
		movespeed = 0;
		vsp = 0;
		mach2 = 0;
		state = states.rocketfistpizzano;
		xscale = move;
	}
	scr_collide_player();
}
