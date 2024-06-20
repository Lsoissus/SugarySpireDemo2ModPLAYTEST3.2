// copy the target objects attributes
image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
// if not angry anymore then destroy
if (!playerid.angry || playerid.state != states.normal)
	instance_destroy();
