val++
bgalpha += 0.1;
scr_getinput();
if (floor(image_index) == (image_number - 1))
	image_speed = 0;
if (obj_player.character == characters.pizzelle)
{
	switch global.rank {
		case "p": 
		sprite_index = spr_rankP; 
		freezecol = { dark: [102/255, 44/255, 60/255],light: [170/255, 73/255, 146/255]}
		break;
		case "s": sprite_index = spr_rankS;
		freezcol = { dark: [192/255, 112/255, 32/255],light: [248/255, 224/255, 128/255]}
		break;
		case "a": sprite_index = spr_rankA; 
		freezecol = { dark: [0.3, 0.13, 0.08],light: [0.68, 0.3, 0.3]}
		break;
		case "b": sprite_index = spr_rankB; 
		freezecol = { dark: [49/255, 104/255, 187/255],light: [144/255, 176, 248/255]}
		break;
		case "c": sprite_index = spr_rankC; 
		freezecol = { dark: [50/255, 40/255, 33/255],light: [133/255, 247/255, 72/255]}
		break;
		case "d": sprite_index = spr_rankD; 
		break;
		case "e": sprite_index = spr_rankP;
		break;
		default: sprite_index = spr_rankD;
		freezecol = { dark: [93/255, 93/255, 93/255],light: [155/255, 155/255, 155/255]}
		break;
	}
}
switch global.rank {
	case "p": freezecol = { dark: [102/255, 44/255, 60/255],light: [170/255, 73/255, 146/255]}
	break;
	case "s": freezecol = { dark: [192/255, 112/255, 32/255],light: [248/255, 224/255, 128/255]}
	break;
	case "a": freezecol = { dark: [0.3, 0.13, 0.08],light: [0.68, 0.3, 0.3]}
	break;
	case "b": freezecol = { dark: [49/255, 104/255, 187/255],light: [144/255, 176, 248/255]}
	break;
	case "c": freezecol = { dark: [50/255, 40/255, 33/255],light: [133/255, 247/255, 72/255]}
	break;
	case "d": freezecol = { dark: [93/255, 93/255, 93/255],light: [155/255, 155/255, 155/255]}
	break;
}
if global.rank == "p"
	targetx = 200
if key_jump && rankreview
{
	scr_hatScript();
	scr_playerreset();
	obj_player.targetDoor = "A";
	obj_player.targetRoom = hub_world1;
	audio_stop_all();
	instance_create(x, y, obj_fadeout);	
}