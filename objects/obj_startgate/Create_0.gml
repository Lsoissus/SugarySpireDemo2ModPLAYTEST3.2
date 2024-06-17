image_index = 1;
image_speed = 0;
depth = 50;
level = "placeholder";
levelrank = ""
levelscore = ""
levelmallow = ""
levelchoco = ""
levelcrack = ""
levelworm = ""
levelcandy = ""
leveljanitor = ""
levelsecret = ""
parallax_struct = {}
old_depth = depth;
gate_surf = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index));
start_parallax = false;
white_alpha = 1;
// im like REALLY lazy and dont want to learn the mess that is a constructor function so youre getting this instead
function add_gate_parallax(_spr, _spd, _dep)
{
	var _ind = struct_names_count(parallax_struct);
	parallax_struct[$ string(_ind)] = {};
	parallax_struct[$ string(_ind)][$ "_sprite"] = _spr;
	parallax_struct[$ string(_ind)][$ "_speed"] = _spd;
	parallax_struct[$ string(_ind)][$ "_depth"] = _dep;
	parallax_struct[$ string(_ind)][$ "_x"] = 0;
}
