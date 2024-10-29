/// @description Insert description here
// You can write your code in this editor
if !instance_exists(obj_lapjanitor) || (instance_exists(obj_lapjanitor) && visible = false && global.lapcutscenedone = 1) || global.panic = 0 || global.lapcutscenedone = 1
return;
if instance_exists(obj_lapjanitor)
{
if obj_lapjanitor.visible = true
{
obj_lapjanitor.visible = false
with (obj_lapjanitorcutscene)
{
visible = true
sprite_index = spr_lapjanitorintro
image_index = 0
image_speed = 0.35
}
with (obj_player)
{
state = states.actor;
			if character = "N"
			sprite_index = spr_pizzano_idle
			else
			sprite_index = spr_player_escapeidle
			movespeed = 0;
			hsp = 0;
			vsp = 0;
			image_speed = 0.35;
}
with (obj_lapPortal)
{
sprite_index = spr_lapportalempty
image_alpha = 1
}
global.lapjanitor = false;
instance_destroy()
}
}





