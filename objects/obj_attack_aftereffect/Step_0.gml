// if above 0 tick down
if (image_alpha > 0)
	image_alpha -= 0.06;
// if 0 then destroy
if (image_alpha <= 0)
	instance_destroy();
