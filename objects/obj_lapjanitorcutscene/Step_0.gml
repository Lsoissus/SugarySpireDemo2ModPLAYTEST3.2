/// @description Insert description here
// You can write your code in this editor
if sprite_index = spr_lapjanitorintro && animation_end() && global.lapcutscenedone = 0 && visible = true
{
with (obj_player)
state = states.normal
image_speed = 0
global.lapcutscenedone = 1
}








