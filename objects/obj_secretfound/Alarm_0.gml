with (obj_tv)
{
	msg = $"You have found {string(global.secretsfound)} secret{(global.secretsfound > 1) ? "s" : ""} out of 3!";
	showtext = true;
	alarm[0] = 150;
}
scr_sound(sound_secretgot);
instance_destroy();
