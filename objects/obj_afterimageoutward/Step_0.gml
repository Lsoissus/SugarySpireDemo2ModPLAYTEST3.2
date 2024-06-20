if (vanish)
{
	// if tick down alpha
	if (gonealpha > 0)
		gonealpha -= 0.15;
	// if alpha is 0 destroy itself
	else if (gonealpha <= 0)
		instance_destroy();
}
visible = playerid.visible;
// go into the struct using a with statement (didnt know thats possible)
with (realcol)
{
	// switch the random color assigned in the create code
	switch (other.color)
	{
		case 1:
			r = 48;
			g = 168;
			b = 248;
			r2 = 15;
			g2 = 57;
			b2 = 121;
			break;
		case 2:
			r = 232;
			g = 80;
			b = 152;
			r2 = 95;
			g2 = 9;
			b2 = 32;
			break;
	}
}
