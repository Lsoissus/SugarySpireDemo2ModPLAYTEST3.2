obj_player.state = states.gottreasure
got = true
x = obj_player.x
y = obj_player.y - 5
scr_sound(sound_treasuregot)
with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_explosioneffect))
{
	sprite_index = spr_taunteffect;
	depth = -2;
}
global.combofreeze = 120
alarm_set(0, 120.45)