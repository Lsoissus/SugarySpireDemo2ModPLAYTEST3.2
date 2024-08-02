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
		freezecol = { dark: [141/255, 83/255, 4/255],light: [180/255, 116/255, 27/255]}
		break;
		case "a": sprite_index = spr_rankA; 
		freezecol = { dark: [104/255, 37/255, 37/255],light: [166/255, 76/255, 70/255]}
		break;
		case "b": sprite_index = spr_rankB; 
		freezecol = { dark: [86/255, 114/255, 180/255],light: [125/255, 152/255, 194/255]}
		break;
		case "c": sprite_index = spr_rankC; 
		freezecol = { dark: [67/255, 123/255, 44/255],light: [176/255, 222/255, 75/255]}
		break;
		case "d": sprite_index = spr_rankD; 
		break;
		case "e": sprite_index = spr_rankP;
		break;
		default: sprite_index = spr_rankD;
		freezecol = { dark: [80/255, 89/255, 97/255],light: [107/255, 120/255, 128/255]}
		break;
	}
}
switch global.rank {
	case "p": freezecol = { dark: [102/255, 44/255, 60/255],light: [170/255, 73/255, 146/255]}
	break;
	case "s": freezecol = { dark: [141/255, 83/255, 4/255],light: [180/255, 116/255, 27/255]}
	break;
	case "a": freezecol = { dark: [104/255, 37/255, 37/255],light: [166/255, 76/255, 70/255]}
	break;
	case "b": freezecol = { dark: [86/255, 114/255, 180/255],light: [125/255, 152/255, 194/255]}
	break;
	case "c": freezecol = { dark: [67/255, 123/255, 44/255],light: [176/255, 222/255, 75/255]}
	break;
	case "d": freezecol = { dark: [80/255, 89/255, 97/255],light: [107/255, 120/255, 128/255]}
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