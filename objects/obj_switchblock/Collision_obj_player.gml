if (buffer == 0)
{
    global.switchblock = (!global.switchblock)
    if (sprite_index == spr_onoffswitch_red || (sprite_index == spr_onoffswitch_bluetored && image_index > 0))
    {
        sprite_index = spr_onoffswitch_redtoblue
        image_index = 0
    }
    if (sprite_index == spr_onoffswitch_blue || (sprite_index == spr_onoffswitch_redtoblue && image_index > 0))
    {
        sprite_index = spr_onoffswitch_bluetored
        image_index = 0
    }
    buffer = 60
    instance_create(x, y, obj_bangeffect)
}
