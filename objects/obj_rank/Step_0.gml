val++
bgalpha += 0.1;
scr_getinput();
if playerresetbuffer > 0
playerresetbuffer--
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
		freezecol = { dark: [184/255, 122/255, 38/255],light: [212/255, 212/255, 156/255]}
		break;
		case "a": sprite_index = spr_rankA; 
		freezecol = freezecol = { dark: [105/255, 38/255, 38/255],light: [167/255, 77/255, 71/255]}
		break;
		case "b": sprite_index = spr_rankB; 
		freezecol = { dark: [60/255, 100/255, 195/255],light: [137/255, 157/255, 201/255]}
		break;
		case "c": sprite_index = spr_rankC; 
		freezecol = { dark: [43/255, 107/255, 46/255],light: [116/255, 212/255, 66/255]}
		break;
		case "d": sprite_index = spr_rankD; 
		break;
		case "e": sprite_index = spr_rankP;
		break;
		default: sprite_index = spr_rankD;
		freezecol = { dark: [38/255, 38/255, 38/255],light: [94/255, 100/255, 105/255]}
		break;
	}
}
switch global.rank {
	case "p": freezecol = { dark: [102/255, 44/255, 60/255],light: [170/255, 73/255, 146/255]}
	break;
	case "s": freezecol = { dark: [184/255, 122/255, 38/255],light: [212/255, 212/255, 156/255]}
	break;
	case "a": freezecol = { dark: [105/255, 38/255, 38/255],light: [167/255, 77/255, 71/255]}
	break;
	case "b": freezecol = { dark: [60/255, 100/255, 195/255],light: [137/255, 157/255, 201/255]}
	break;
	case "c": freezecol = { dark: [43/255, 107/255, 46/255],light: [116/255, 212/255, 66/255]}
	break;
	case "d": freezecol = { dark: [38/255, 38/255, 38/255],light: [94/255, 100/255, 105/255]}
	break;
}
if global.rank == "p"
	targetx = 200
if key_jump && rankreview
{
	playerresetbuffer = 20
	scr_hatScript();
	scr_playerreset();
	obj_player.targetDoor = "A";
	obj_player.targetRoom = hub_world1;
	audio_stop_all();
	instance_create(x, y, obj_fadeout);	
}