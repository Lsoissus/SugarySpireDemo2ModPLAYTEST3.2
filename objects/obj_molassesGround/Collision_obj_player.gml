if (obj_player.vsp < 0)
{
	obj_player.vsp *= 0.2
	instance_create(obj_player.x, obj_player.y, obj_molassesparticle)
}
if (obj_player.hsp != 0)
	instance_create(obj_player.x, obj_player.y, obj_molassesparticle)