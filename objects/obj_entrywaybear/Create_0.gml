// TODO: add sprites

enum BEARDIR
{
	LEFT = -1,
	RIGHT = 1
};

image_speed = 0.35;

movespd = 0;
hsp = 0;
vsp = 0;
grav = 0.5;
grounded = false;

// in creation code, write something like
/*
	movespd = 4;
	taunted = function() 
	{
		sprite_index = spr_bearshocked; (or whatever)
		movespd = 0;
	}
*/
// it should theoretically work.

// I made an example in devroom.
taunted = function() { sprite_index = spr_null };