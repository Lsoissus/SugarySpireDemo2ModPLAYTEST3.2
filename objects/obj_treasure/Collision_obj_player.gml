if !got
{
	obj_player.state = states.gottreasure
	got = true
	x = obj_player.x
	y = obj_player.y - 8
	scr_sound(sound_treasuregot)
	with (instance_create(x,y, obj_explosioneffect))
	{
		sprite_index = spr_taunteffect;
		depth = -2;
	}
	global.combofreeze = 120
	alarm_set(0, 120.45)
}