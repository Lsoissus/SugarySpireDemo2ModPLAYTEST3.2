function scr_enemy_turn()
{
	sprite_index = turnspr;
	image_speed = 0.35;
	hsp = 0;
	if (animation_end())
	{
		state = baddiestates.idle;
		image_index = 0;
		sprite_index = idlespr;
		image_xscale *= -1;
	}
}
