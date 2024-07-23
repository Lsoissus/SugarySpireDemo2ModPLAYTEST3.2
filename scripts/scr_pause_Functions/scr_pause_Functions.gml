// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_pause_image()
{
var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])
var cam_w = camera_get_view_width(view_camera[0])
var cam_h = camera_get_view_height(view_camera[0])
draw_set_alpha(1)
 screensprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0)
    screenscale = min(((cam_x + cam_w) / surface_get_width(application_surface)), ((cam_y + cam_h) / surface_get_height(application_surface)))
}
function scr_draw_pause_image()
{
 var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])
var cam_w = camera_get_view_width(view_camera[0])
var cam_h = camera_get_view_height(view_camera[0])
var cam_target = camera_get_view_target(view_camera[0])
draw_rectangle_color(0, 0, (cam_x + cam_w), (cam_y + cam_h), c_black, c_black, c_black, c_black, false)
  draw_sprite_ext(screensprite, 0, (0), (0), 1, 1, 0, c_white, 1)
}
function scr_delete_pause_image() 
{
    if sprite_exists(screensprite)
        sprite_delete(screensprite)
}