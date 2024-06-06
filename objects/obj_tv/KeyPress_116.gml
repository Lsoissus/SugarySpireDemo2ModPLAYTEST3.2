if (obj_player.character == characters.pizzelle)
{
	obj_player.character = characters.pizzano;
	scr_characterspr();
	scr_tvsprites();
	tvcount = 500;
}
else if (obj_player.character == characters.pizzano)
{
	obj_player.character = characters.pizzelle;
	scr_tvsprites();
	tvcount = 500;
}
