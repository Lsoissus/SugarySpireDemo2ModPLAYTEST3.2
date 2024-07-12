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
parallax_array = [];
old_depth = depth;
gate_surf = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index));
start_parallax = false;
white_alpha = 1;
confecti_array = ["mallow", "choco", "crack", "worm", "candy"]
foreach_iteration = 0;
foreach_spacing = 0;
rank_array = ["d", "c", "b", "a", "s", "p"];
near_gate = false;
function add_gate_parallax(_spr, _spd)
{
	return { _sprite : _spr, _speed : _spd, _x : 0 };
}
titlecard_sprite = spr_crunchytitlecard
titlecard_index = 0
title_sprite = spr_crunchytitle
title_index = 0
title_music = mu_crunchytitlecard
