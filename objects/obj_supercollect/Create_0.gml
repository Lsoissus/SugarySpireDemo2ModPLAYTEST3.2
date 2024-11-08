collectvanish = false;
collectboxid = -4;
in_the_void = false;
depth = -1;
with (other.id)
{
	sprite_index = choose(spr_candy_pal, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
	image_speed = 0.35;
	global.collected = false;
}