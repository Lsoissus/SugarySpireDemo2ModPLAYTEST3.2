var _move = 1
if (image_alpha == 1)
{
    if _move
    {
        var dir = point_direction(x, y, obj_player.x, obj_player.y)
        x += lengthdir_x(8, dir)
        y += lengthdir_y(8, dir)
    }
}
else
    image_alpha += 0.01
if instance_place(x, y, obj_player) && !instance_exists(obj_endlevelfade) && !instance_exists(obj_fadeout) && image_alpha == 1
{
	with (obj_player)
	{
		targetRoom = timesuproom
		targetDoor = "A"
		if (!instance_exists(obj_fadeout))
		{
			instance_create(x, y, obj_fadeout)
			audio_stop_all()
			scr_sound(mu_timesup)
		}
		state = states.timesup
		instance_destroy(obj_coneball)
	}
}