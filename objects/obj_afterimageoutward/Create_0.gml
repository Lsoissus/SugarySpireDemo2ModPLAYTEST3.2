// id of the target
playerid = obj_player;
// define new builtin vars
image_speed = 0;
image_alpha = 1;
sprite_index = obj_player.sprite_index;
color = choose(1, 2);
// define a struct with some variables
realcol = 
{
	r: 0,
	g: 0,
	b: 0,
	r2: 0,
	g2: 0,
	b2: 0
};
// define a timer and run alarms
blink_time = 3;
alarm[1] = blink_time;
alarm[0] = 13;
// define other important variables
gonealpha = 0.85;
vanish = false;
spr_palette = spr_afterimagepal;
draw_angle = obj_player.draw_angle;
