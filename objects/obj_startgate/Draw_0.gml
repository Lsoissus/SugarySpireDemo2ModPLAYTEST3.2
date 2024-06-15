//draw_self()
old_depth = object_get_depth();
if (start_parallax)
{
	if !surface_exists(gate_surf)
		gate_surf = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index));
	else
	{
		surface_set_target(gate_surf);
		struct_foreach(parallax_struct, function(_name, _data)
		{
			var _struct = parallax_struct[$ _name];
			_struct._x -= _struct._speed;
			depth = _struct._depth;
			draw_sprite_tiled(_struct._sprite, 0, _struct._x, 0);
		});
		gpu_set_blendmode(bm_subtract);
		if sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "_mask"))
			draw_sprite(asset_get_index(sprite_get_name(sprite_index) + "_mask"), 0, x, y);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
	draw_surface(gate_surf, x - (sprite_get_width(sprite_index)/2), y - sprite_get_height(sprite_index))
}
draw_sprite(sprite_index, 0, x, y)
white_alpha = lerp(white_alpha, start_parallax, 0.05)
draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_white, white_alpha)
depth = old_depth;