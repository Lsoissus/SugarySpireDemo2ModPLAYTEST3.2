function scr_pizzano_twirl()
{
	sprite_index = spr_pizzano_twirl;
	move = key_left + key_right;
	hsp = xscale * movespeed;
	if (move == xscale && movespeed < 12)
		movespeed += 0.5;
	else if (move != xscale && movespeed > 0)
		movespeed -= 0.5;
	if movespeed <= 0 && move != 0
		xscale *= -1;
	if (grounded && !key_attack)
	{
		state = states.normal;
		image_index = 0;
		mach2 = 0;
		jumpstop = false;
	}
	else if (grounded && key_attack)
	{
		state = states.mach2;
		image_index = 0;
		sprite_index = spr_mach;
		jumpstop = false;
	}
	if key_down
		vsp = 10;
	if (key_slap2 && character == characters.pizzano && !key_up)
	{
		flash = true;
		state = states.rocketfistpizzano;
		sprite_index = spr_pizzano_sjumpprepside;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		charged = false;
	}
	if (key_slap2 && key_up && character == characters.pizzano)
	{
		flash = true;
		alarm[0] = 240;
		image_index = 0;
		state = states.Sjump;
		sprite_index = spr_pizzano_sjumpprep;
	}
	if (character == characters.pizzano && !grounded && scr_solid(x + move, y, true))
	{
		wallspeed = movespeed;
		grabclimbbuffer = 0;
		machhitAnim = false;
		state = states.climbwall;
	}
	if (key_taunt2)
	{
		taunttimer = 20;
		tauntstoredmovespeed = movespeed;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		state = states.backbreaker;
		if (supertauntcharged)
		{
			image_index = 0;
			sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3);
		}
		else
		{
			image_index = irandom_range(0, sprite_get_number(spr_player_taunt));
			sprite_index = spr_player_taunt;
		}
		instance_create(x, y, obj_taunteffect);
	}
}