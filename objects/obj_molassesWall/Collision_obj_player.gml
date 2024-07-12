with (obj_player) {
	if (wallspeed > 0) {
		wallspeed -= 0.25;
		instance_create(x, y, obj_molassesparticle);
	}
	if (vsp != 0)
		instance_create(x, y, obj_molassesparticle);
}