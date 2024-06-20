// set apply the afterimage shader
shader_set(shd_afterimage);
// get the uniform of the blendcolor1 variable and apply the structs color variables
var colorblend1 = shader_get_uniform(shd_afterimage, "blendcolor1");
shader_set_uniform_f(colorblend1, realcol.r / 255, realcol.g / 255, realcol.b / 255);
// get the uniform of the blendcolor2 variable and apply the structs color variables
var colorblend2 = shader_get_uniform(shd_afterimage, "blendcolor2");
shader_set_uniform_f(colorblend2, realcol.r2 / 255, realcol.g2 / 255, realcol.b2 / 255);
// draw the sprite and stop applying the shader
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, draw_angle, c_white, gonealpha * image_alpha);
shader_reset();
