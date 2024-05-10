visible = obj_player.visible
if (color == 1)
    realcol = make_color_rgb(232, 80, 152)
else if (color == 2)
    realcol = make_color_rgb(48, 168, 255)
if (image_alpha > 0)
    image_alpha -= 0.05
else
    instance_destroy()
