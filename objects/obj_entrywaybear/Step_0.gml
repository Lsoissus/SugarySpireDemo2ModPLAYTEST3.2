if (obj_player.state = states.backbreaker && distance_to_object(obj_player) < 400)
{
	taunted();
}

// taken from scr_enemy_walk
if (scr_solid(x + image_xscale, y) && !scr_slope_ext(x + image_xscale, y))
	image_xscale *= -1;
	
with (instance_place(x + sign(image_xscale), y, obj_hallway))
{
	var backtoroom = -sign(image_xscale);
	if (sign(other.image_xscale) != backtoroom)
	{
		with (other.id)
			image_xscale *= -1;
	}
}

if (!scr_solid(x + (image_xscale * 15), y + 31))
	image_xscale *= -1;

hsp = movespd * image_xscale;

scr_collide();