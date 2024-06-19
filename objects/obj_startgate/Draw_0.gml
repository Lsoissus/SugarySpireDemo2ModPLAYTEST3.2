old_depth = object_get_depth();
if (white_alpha != 1)
{
	// create surface is surface is dead
	if !surface_exists(gate_surf)
		gate_surf = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index));
	else // gamemaker likes to kill surfaces at random, its important to put the surface drawing related code here
	{
		surface_set_target(gate_surf);
		// loop through array defined in instance creation code
		for (var l = 0; l < array_length(parallax_array); l++;)
		{
			// basically this var is the struct variable
			var _struct = parallax_array[l];
			// apply movement
			_struct._x -= _struct._speed;
			// draw the sprite
			draw_sprite_tiled(_struct._sprite, 0, _struct._x, 0);
		}
		// masking time
		gpu_set_blendmode(bm_subtract);
		// check if a sprite name ends with '_mask', if so then draw it. 
		if sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "_mask"))
			draw_sprite(asset_get_index(sprite_get_name(sprite_index) + "_mask"), 0, 0, 0);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
	draw_surface(gate_surf, x - (sprite_get_width(sprite_index)/2), y - sprite_get_height(sprite_index))
}
else
	surface_free(gate_surf) // if far away, kill the surface for performance reasons
depth = old_depth;
draw_sprite(sprite_index, 0, x, y)
white_alpha = lerp(white_alpha, !start_parallax, 0.05)
draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_white, white_alpha)
ini_open("saveData.ini");
// statistics display
if (near_gate)
{
	var _spacing = -100;
	for (var i = 0; i < array_length(confecti_array); i++;)
	{
		var _val = ini_read_real(level + "_confecti", "confecti" + confecti_array[i], false)
		if !_val
			gpu_set_fog(true, c_black, 0, 10000);
		draw_sprite(asset_get_index("spr_" + confecti_array[i] + "_taunt"), 0, x + _spacing , y - sprite_get_height(sprite_index) - 75)
		gpu_set_fog(false, c_white, 0, 0);
		_spacing += 50;
	}

	draw_set_font(global.smallfont);
	var _secretsfound = ini_read_real("Secrets", level, 0);
	var _score = ini_read_real("Scores", level, 0);
	var _laps = ini_read_real("Laps", level, 0);
	var _reallystupidS = (_laps == 1 ? "" : "S")
	draw_text(x, y - sprite_get_height(sprite_index) - 25, string(_secretsfound) + " OF 3 SECRETS");
	draw_text(x, y - sprite_get_height(sprite_index) + 5, string(_score) + " POINTS - " + string(_laps) + " LAP" + _reallystupidS);
	// rank bubble
	var _rank = ini_read_string("Ranks", level, "d");
	draw_sprite(spr_ranks_hud, array_get_index(rank_array, _rank), x - sprite_get_width(spr_ranks_hud)/2, y - sprite_get_height(sprite_index) + 37);
}

ini_close();