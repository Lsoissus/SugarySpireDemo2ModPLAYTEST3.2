// moved to function called in instance creation code because of a declaration issue.
function init_startgate()
{
	ini_open("saveData.ini");
	for (var l = 0; l < array_length(confecti_array); l++;)
	{
		confecti_struct[$ confecti_array[l]] = ini_read_real(level + "_confecti", "confecti" + other.confecti_array[l], false)
	}
	ini_close();
}
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
confecti_array = ["mallow", "choco", "crack", "worm", "candy"]
confecti_struct = {};
foreach_iteration = 0;
foreach_spacing = 0;
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
