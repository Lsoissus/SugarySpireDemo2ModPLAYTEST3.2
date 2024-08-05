with (obj_player)
{
	if (state != states.cotton && state != states.cottondrill && state != states.door && state != states.cottonroll && state != states.pizzanokungfu)
	{
		global.combofreeze = 30;
		state = states.cotton;
		with instance_create(x, y, obj_poofeffect)
			paletteselect = 1;
		sprite_index = spr_cottonidle;
	}
}