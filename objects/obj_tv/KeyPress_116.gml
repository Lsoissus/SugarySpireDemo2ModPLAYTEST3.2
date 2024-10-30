with (obj_player) {
	if (character == characters.pizzelle)
		character = characters.pizzano;
	else if (character == characters.pizzano)
		character = characters.pizzelle;
	scr_characterspr();
}
scr_tvsprites();
tvcount = 500;