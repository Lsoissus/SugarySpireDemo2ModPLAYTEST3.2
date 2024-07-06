if global.panic
{
    image_alpha = 1
    if (collectvanish == 1 && collectboxid.activated == 1)
    {
        x = xstart
        y = ystart
        instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_cloudeffect)
        repeat (3)
            instance_create(((x + (sprite_width / 2)) + random_range(-5, 5)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
        collectvanish = 0
        in_the_void = 0
    }
    if (global.collectsound < 10)
        global.collectsound += 1
}
else
    image_alpha = 0.5
image_speed = 0.35
