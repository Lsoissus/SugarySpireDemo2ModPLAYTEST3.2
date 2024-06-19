function scr_player_noclip()
{
	// set movement variables
	var move_x = key_left + key_right;
	var move_y = key_down - key_up;
	// reset speed variables
	hsp = 0;
	vsp = 0;
	if (key_slap || key_jump)
		state = states.normal;
	// move player
	x += move_x * (key_attack ? 30 : 10);
	y += move_y * (key_attack ? 30 : 10);

}