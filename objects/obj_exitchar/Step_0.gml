switch state
{
    case states.titlescreen:
        x = (camera_get_view_x(view_camera[0]) - 100)
        y = (camera_get_view_y(view_camera[0]) - 100)
        var dx = 350
        var dy = 400
        if (global.panic && distance_to_pos(xstart, ystart, obj_player.x, obj_player.y, dx, dy))
        {
            state = states.freefall
            vsp = 20
                sprite_index = spr_rosette_fall

            x = xstart
            y = (camera_get_view_y(view_camera[0]) - 100)
        }
        break
    case states.freefall:
        y += vsp
        if ((vsp < 20))
            vsp += 0.5
        with (instance_place(x, y, obj_baddie))
            instance_destroy()
        if ((y >= ystart))
        {
            y = ystart
            state = states.normal
                sprite_index = spr_rosettesign

            image_index = 0
        }
        break
    case states.freefallland:
        if ((floor(image_index) == (image_number - 1)))
        {
                sprite_index = spr_rosettesign
            image_index = 0
            state = states.normal
        }
        break
}

if ((state == states.titlescreen))
    visible = false
else
    visible = true









