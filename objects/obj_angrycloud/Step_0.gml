// copy the target objects attributes
image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
// if combo is less than 3 then destroy
if (global.combo < 3 || playerid.state != states.normal)
	instance_destroy();