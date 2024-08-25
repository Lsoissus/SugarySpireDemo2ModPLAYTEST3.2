with (obj_player)
{
	if (state != states.cotton && state != states.cottondrill && state != states.door && state != states.cottonroll && state != states.pizzanokungfu)
	{
		 if (key_up && ((state == states.normal) || (state == states.mach2) || (state == states.mach3) || (state == states.Sjumpprep)))
            {
		global.combofreeze = 60;
		state = states.cotton;
		with instance_create(x, y, obj_poofeffect)
			paletteselect = 1;
		 sprite_index = spr_player_cottontransfo
                xscale = 1
                other.visible = false
                x = ((other.x - other.sprite_xoffset) + (other.sprite_width / 2))
                image_speed = 0.35
			}
	}
}