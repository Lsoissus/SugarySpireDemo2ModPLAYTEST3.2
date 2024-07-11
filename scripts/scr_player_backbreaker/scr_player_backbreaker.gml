function scr_player_backbreaker()
{	
	if (sprite_index != spr_player_machfreefall)
	{
		hsp = 0;
		movespeed = 0;
	}
	else
		hsp = xscale * movespeed;
	landAnim = false;
	switch sprite_index
	{
		case spr_pizzelle_taunt:
		case spr_gumbob_taunt:
		case spr_pizzano_taunt:
		case spr_player_supertaunt:
		image_speed = 0;
		taunttimer--;
		vsp = 0;
		if (!instance_exists(parryid))
		{
			with (instance_create(x, y, obj_parryhitbox))
			{
				other.parryid = id;
				image_xscale = other.xscale;
			}
		}
		if (!taunttimer)
		{
			movespeed = tauntstoredmovespeed;
			sprite_index = tauntstoredsprite;
			state = tauntstoredstate;
		}
		break;
		case spr_player_machfreefall:
		if place_meeting(x, y + 1, obj_solid)
		{
			state = states.machslide;
			sprite_index = spr_player_crouchslide;
		}
		break;
		
	}
	if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3)
	{
		vsp = 0;
		hsp = 0;
		supertauntbuffer = 100;
		if (floor(image_index) >= 5 && supertauntcharged)
		{
			instance_create(x, y, obj_supertaunthitbox);
			with (instance_create(x, y, obj_tauntaftereffectspawner))
				playerid = other.id;
			if (!instance_exists(parryid))
			{
				with (instance_create(x, y, obj_parryhitbox))
				{
					other.parryid = id;
					image_xscale = other.xscale;
				}
			}
			supertauntcharged = false;
		}
		if (animation_end())
		{
			supertauntbuffer = 0;
			supertauntcharged = false;
			movespeed = tauntstoredmovespeed;
			sprite_index = tauntstoredsprite;
			state = tauntstoredstate;
		}
	}
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_Timesup))
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete || sprite_index == spr_playerN_victory))
		state = states.normal
	if (sprite_index != spr_player_taunt)
		image_speed = 0.35;
	else if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3)
		image_speed = 0.5;
}
