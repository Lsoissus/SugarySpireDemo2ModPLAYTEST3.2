var _move = 1
if (image_alpha >= 1)
{
    if _move
    {
        var dir = point_direction(x, y, obj_player.x, obj_player.y)
        x += lengthdir_x(maxspeed, dir)
        y += lengthdir_y(maxspeed, dir)
    }
}
else if (image_alpha < 1)
    image_alpha += 0.01
if (image_alpha >= 1)
{
    if place_meeting(x, y, obj_player)
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
}
maxspeed += 0.01
if (x != obj_player.x)
    image_xscale = (-(sign((x - obj_player.x))))
