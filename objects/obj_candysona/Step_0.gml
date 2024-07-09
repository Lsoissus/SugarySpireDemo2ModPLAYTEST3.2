if place_meeting(x, y, obj_player)
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.throwspr
    sprite_index = spr_null
    scr_sound(sound_combo1)
    instance_create(x, y, obj_candysona_points)
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = (40 / room_speed)
    }
}
