if sprite_index == spr_secretportal_spawnopennew
{
	sprite_index = spr_secretportal_spawnidle
	alarm[3] = 90	
}
if sprite_index = spr_secretportal_spawnclosenew
instance_destroy()