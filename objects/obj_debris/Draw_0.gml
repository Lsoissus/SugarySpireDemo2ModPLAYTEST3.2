/// @description Insert description here
// You can write your code in this editor
if ((sprite_index == spr_introdebris))
{
    pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha)
    draw_self()
    shader_reset()
}
else
    draw_self()








