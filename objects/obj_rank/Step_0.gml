scr_getinput();
if (floor(image_index) == (image_number - 1))
	image_speed = 0;
if (obj_player.character == characters.pizzelle)
{
	switch global.rank {
		case "p": sprite_index = spr_rankP; break;
		case "s": sprite_index = spr_rankS; break;
		case "a": sprite_index = spr_rankA; break;
		case "b": sprite_index = spr_rankB; break;
		case "c": sprite_index = spr_rankC; break;
		case "d": sprite_index = spr_rankD; break;
		case "e": sprite_index = spr_rankP; break;
		default: sprite_index = spr_rankD; break;
	}
}