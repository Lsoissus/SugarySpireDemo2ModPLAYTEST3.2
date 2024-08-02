draw_set_alpha(fadealpha);
draw_set_color(c_white);
draw_set_alpha(whiteflashAlpha)
draw_rectangle(-64, -64, camera_get_view_width(view_camera[0]) + 64, camera_get_view_height(view_camera[0]) + 64, false);
if flashbuffer = 0
whiteflashAlpha = lerp(whiteflashAlpha, 0, 0.2)
draw_set_color(c_white);
draw_set_alpha(1);
