if (room == rank_room || room == timesuproom)
	visible = false;
else
	visible = true;
if (global.panic)
	timestop = false;
if (!global.panic)
	timestop = true;
if (global.seconds == 0 && global.minutes == 0)
	alarm[1] = -1;
if (global.seconds < 0)
{
	global.seconds = 59;
	global.minutes -= 1;
}
if (global.seconds > 59)
{
	global.minutes += 1;
	global.seconds -= 59;
}
if (global.playseconds > 59)
{
	global.playminutes += 1;
	global.playseconds -= 59;
}
if ((room != realtitlescreen) && room != rm_initializer && (room != hub_room1) && room != hub_world1 && room != hub_world2new && room != hub_worldstart && room != hub_worldtutorialhall && (room != scootercutsceneidk) && (room != outer_room1) && (room != outer_room2) && (room != parlor_1) && (room != parlor_2) && (room != palroom) && (room != parlor_3) && (room != parlor_4) && (room != parlor_5) && (room != parlor_6) && (room != parlor_7) && (room != parlor_8) && (room != parlor_9) && (room != parlor_10) && sprite_index != parlornew_1 && sprite_index != parlornew_2 && sprite_index != parlornew_3 && sprite_index != parlornew_4 && sprite_index != parlornew_5 && (room != secrets_await) && (room != devroom))
{
    if (((obj_player.state == states.backbreaker) && ((obj_player.sprite_index == obj_player.spr_Timesup) || (obj_player.sprite_index == spr_player_walkfront))) || (room == hub_room1))
    {
        global.playtimermiliseconds = 0
        global.playtimerseconds = 0
        global.playtimerminutes = 0
        global.playtimerhour = 0
    }
    else
    {
        global.playtimermiliseconds += 1
        if ((global.playtimermiliseconds >= 60))
        {
            global.playtimermiliseconds = 0
            global.playtimerseconds += 1
            if ((global.playtimerseconds >= 60))
            {
                global.playtimerseconds = 0
                global.playtimerminutes += 1
                if ((global.playtimerminutes >= 60))
                {
                    global.playtimerminutes = 0
                    global.playtimerhour += 1
                }
            }
        }
    }
}
if (global.panic)
{
	panicshake = clamp(lerp(1, 2.15, global.wave / global.maxwave), 1, 2.15);
	panicshakeacc = 3 / room_speed;
}
else
{
	panicshake = 0;
	panicshakeacc = 0;
}
panicshake = approach(panicshake, 0, panicshakeacc);
if (shake_mag > 0)
{
	shake_mag -= shake_mag_acc;
	if (shake_mag < 0)
		shake_mag = 0;
}
var lspd = 0.05;
cam_angle = lerp(cam_angle, cam_langle, lspd);
cam_zoom = lerp(cam_zoom, cam_lzoom, lspd);
camera_set_view_angle(view_camera[0], cam_angle);
var vw = cam_w * cam_zoom;
var vh = cam_h * cam_zoom;
camera_set_view_size(view_camera[0], vw, vh);
if (instance_exists(obj_player) && (obj_player.state != states.timesup && obj_player.state != states.gameover))
{
	var target = 
	{
		x: global.targetCamX,
		y: global.targetCamY
	};
	var _cam_x = target.x - (vw / 2);
	var _cam_y = target.y - (vh / 2);
	var _shake_x = 0;
	var _shake_y = 0;
	if (obj_player.state == states.mach3 || (obj_player.state == states.minecart && obj_player.movespeed > 10) || obj_player.state == states.machroll)
	{
		var _targetcharge = obj_player.xscale * ((obj_player.movespeed / 6) * 50);
		var _tspeed = 2;
		if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
			_tspeed = 8;
		if (chargecamera > _targetcharge)
			chargecamera -= _tspeed;
		if (chargecamera < _targetcharge)
			chargecamera += _tspeed;
	}
	else
	{
		if (chargecamera > 0)
			chargecamera -= 2;
		if (chargecamera < 0)
			chargecamera += 2;
	}
	_cam_x += chargecamera;
	_cam_x = clamp(_cam_x, Camera_xorigin, (Camera_xorigin + Camera_width) - vw);
	_cam_y = clamp(_cam_y, Camera_yorigin, (Camera_yorigin + Camera_height) - vh);
	_cam_x = clamp(_cam_x, 0, room_width - vw);
	_cam_y = clamp(_cam_y, 0, room_height - vh);
	_shake_x += irandom_range(-panicshake, panicshake);
	_shake_y += irandom_range(-panicshake, panicshake);
	if (shake_mag != 0)
	{
		_shake_x += irandom_range(-shake_mag, shake_mag);
		_shake_y += irandom_range(-shake_mag, shake_mag);
	}
	lspd = 0.25;
	if (global.smoothcam)
	{
		Cam_x = lerp(Cam_x, _cam_x, lspd);
		Cam_y = lerp(Cam_y, _cam_y, lspd);
	}
	else
	{
		Cam_x = _cam_x;
		Cam_y = _cam_y;
	}
	camera_set_view_pos(view_camera[0], Cam_x + _shake_x, Cam_y + _shake_y);
}
if (global.panic && global.minutes == 0 && global.seconds == 0 && room != timesuproom)
{
if (!instance_exists(obj_coneball))
{
	instance_create(0, 0, obj_coneball);
	scr_sound(sfx_coneball)
}
}
if (global.panic && global.screentilt)
{
	camera_set_view_angle(view_camera[0], camera_get_view_angle(view_camera[0]) + scr_sin(3 * clamp(global.wave / global.maxwave, 0, 1), 65 - (5 * clamp(global.wave / global.maxwave, 0, 1))));
	clamp(angle, -5, 5);
	if (angle >= 5)
		angledir = -1;
	else if (angle <= -5)
		angledir = 1;
	if (angle < 5 && angledir == 1)
		angle += 0.025;
	if (angle > -5 && angledir == -1)
		angle -= 0.025;
}
else
	camera_set_view_angle(view_camera[0], cam_angle);
if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x < (350 + obj_camera.Cam_x))
	DrawY = lerp(DrawY, -300, 0.15);
else
	DrawY = lerp(DrawY, 0, 0.15);
if (global.panicbg && global.panic)
	global.wave = clamp(clamp(global.wave + (60 / room_speed), 0, global.maxwave - (((global.minutes * 60) + global.seconds) * 60)), 0, global.maxwave);
Collectshake = approach(Collectshake, 0, 20 / room_speed);

#region BAR TIMER

timer_xstart = cam_w / 2 + timer_xplus
timer_ystart = cam_h + timer_yplus
timer_x = timer_xstart
coneball_index += 0.35
roll_index += 0.35
var time = floor((target_fill / 60))
var secs = max((time % 60), 0)
if global.panic
{
    if (((((global.minutes * 60) + global.seconds) * 60) > 0))
    {
        var _spd = ((1 - (target_fill / global.maxwave)) * (sprite_get_number(spr_coneball_bartimer_roll) * 10))
        roll_index = (_spd % sprite_get_number(spr_coneball_bartimer_roll))
        timer_y = approach(timer_y, -136, 1)
    }
    else
    {
        if ((timer_buffer > 0))
            timer_buffer--
        if ((timer_buffer == 0))
            timer_y = approach(timer_y, 300, 0.8)
    }
}
else
{
    timer_y = 0
    coneball_sprite = spr_coneball_bartimer
}
/*if global.panic && global.fill < (chunkmax / 5)
    coneball_pal = 1*/

#endregion