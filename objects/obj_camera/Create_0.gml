pal = undefined;
old_collect = 0;
pal_width = sprite_get_width(spr_fontcollect);
color_array[0] = irandom_range(0,pal_width);
color_array[1] = irandom_range(0,pal_width);
color_array[2] = irandom_range(0,pal_width);
color_array[3] = irandom_range(0,pal_width);
color_array[4] = irandom_range(0,pal_width);
color_array[5] = irandom_range(0,pal_width);
color_array[6] = irandom_range(0,pal_width);
color_array[7] = irandom_range(0,pal_width);
color_array[8] = irandom_range(0,pal_width);
color_array[9] = irandom_range(0,pal_width);

n = 0;
Collectshake = 0;
Camera_width = room_width;
Camera_height = room_height;
Camera_xorigin = 0;
Camera_yorigin = 0;
panicshake = 0;
panicshakeacc = 0;
rank_scale = 1
DrawY = 0
candlepal = spr_fontcollect
image_speed = 0.35;
alarm[1] = 60;
alarm[2] = 3;
alarm[3] = 60;
global.seconds = 59;
global.minutes = 1;
angle = 0;
angledir = 1;
frame = 0;
global.pizza = 0;
global.pizzameter = 0;
global.pillarhunger = 4000;
global.treat = 0;
basement = 0;
shake_mag = 0;
shake_mag_acc = 0;
timestop = true;
zoom = 0;
chargecamera = 0;
alpha = 1;
window_set_size(960, 540);
global.panicbg = 1;
global.maxwave = 0;
global.wave = 0;
pizzaindex = 0;
heatpal = 0;
global.playseconds = 0;
global.playminutes = 0;
global.login = 0;
global.starrmode = 0;
global.switchactivated = 0;
Cam_x = 0;
Cam_y = 0;
cam_angle = 0;
cam_zoom = 1;
cam_langle = 0;
cam_lzoom = 1;
cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);