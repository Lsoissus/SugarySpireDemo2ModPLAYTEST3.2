pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
/* draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_white, image_alpha)
you're drawing the sprite twice */
draw_self();
shader_reset();