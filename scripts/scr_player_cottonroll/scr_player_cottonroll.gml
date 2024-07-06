function scr_player_cottonroll()
{
    if (movespeed >= 8)
        sprite_index = spr_cotton_maxroll
    else
        sprite_index = spr_cotton_roll
    hsp = (xscale * movespeed)
    dir = xscale
    momemtum = 1
    if (scr_solid((x + xscale), y, 1) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_chocofrogbig))))
    {
        xscale *= -1
        movespeed /= 2
        instance_create(x, y, obj_bangeffect)
    }
    if (movespeed < 3)
        movespeed = 3
    if (grounded && (!key_down) && movespeed < 8 && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        state = states.cotton
        sprite_index = spr_cotton_idle
        momemtum = 1
    }
    if (key_jump && (!grounded))
    {
        momemtum = 1
        state = states.cotton
        vsp = -10
        grav = 0.1
        image_index = 0
        sprite_index = spr_cotton_doublejump
        with (instance_create(x, y, obj_highjumpcloud2))
        {
            image_xscale = other.xscale
            sprite_index = spr_cottonpoof
        }
        scr_sound(sound_enemystomp)
    }
    if (key_jump && grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        momemtum = 1
        state = states.cotton
        vsp = -14
        grav = 0.025
        image_index = 0
        sprite_index = spr_cotton_jump
        instance_create(x, y, obj_highjumpcloud2)
        scr_sound(sound_destroyblock2)
    }
    var _xscale = xscale
    if place_meeting(x, (y + 1), obj_slope)
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            var slope_acceleration = (abs(image_yscale) / abs(image_xscale))
            if (_xscale == sign(image_xscale))
            {
                if (room != steamy_7)
                {
                    if (other.movespeed > 3)
                        other.movespeed -= (0.35 * slope_acceleration)
                    else
                    {
                        other.movespeed = 3
                        other.xscale = (-sign(image_xscale))
                    }
                }
                else if (room == steamy_7)
                {
                    if (other.movespeed > 3)
                        other.movespeed -= (0.25 * slope_acceleration)
                    else
                    {
                        other.movespeed = 3
                        other.xscale = (-sign(image_xscale))
                    }
                }
            }
            else if (_xscale == (-sign(image_xscale)))
            {
                if (room != steamy_7)
                {
                    if (other.movespeed < 12)
                        other.movespeed += (0.35 * slope_acceleration)
                }
                else if (room == steamy_7)
                {
                    if (other.movespeed < 12)
                        other.movespeed += (0.25 * slope_acceleration)
                }
            }
        }
    }
    dir = xscale
    image_speed = (0.35 + ((movespeed / 12) * 0.35))
}
