if active
{
    with (obj_player)
    {
        state = "actor"
        hsp = 0
        vsp = 0
        visible = false
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_lapportal:
            scr_sound(sound_lapenter)
            sprite_index = spr_lapportalenter
            break
        case spr_lapportalenter:
            sprite_index = spr_lapportalexit
            with (obj_player)
            {
                state = states.freefallprep
                visible = true
            }
            active = 0
            break
        case spr_lapportalexit:
          //instance_create_unique(0, 0, obj_lap2visual)
            instance_destroy()
            break
    }

}