function cutscene_lapPortal_start()
{
	var finished = false;
	global.combotime = 60
	if !audio_is_playing(sound_lapenter)
		scr_sound(sound_lapenter)
	if (!finished)
	{
		with (obj_player)
		{
			state = states.actor;
			sprite_index = spr_lapportalenter;
			movespeed = 0;
			hsp = 0;
			vsp = 0;
			image_speed = 0.35;
			if floor(image_index) == image_number - 1
				finished = true;
		}
	}
	if (finished)
	{
		var _collect = global.inflap ? 100 : 3000
		ds_list_add(global.saveroom, other.id);
		global.collect += _collect;
		global.combotime = 60;
		with instance_create(x, y, obj_smallnumber)
			number = string(_collect);
		global.laps++
		if global.inflap {
			global.minutes += 1;
			global.seconds += 15;
		}
		ds_list_clear(global.escaperoom)
		if !instance_exists(obj_fadeout) {
			scr_sound(sound_door);
			instance_create(0, 0, obj_fadeout);
		}
		cutscene_event_end();
	}
}
function cutscene_lapPortal_middle()
{
	var finished = false;
	global.combotime = 60
	static _portalID = noone
	if !audio_is_playing(sound_lapexit)
		scr_sound(sound_lapexit)
	with (obj_player)
	{
		visible = false;
		state = states.actor;
		sprite_index = spr_player_pound;
		movespeed = 0;
		hsp = 0;
		vsp = 0;
		image_speed = 0.35;
		if !instance_exists(obj_fadeout) { 
			if !instance_exists(_portalID) {
				_portalID = instance_create(x, y + 14, obj_lapPortalexitNEW)
			}
			else {
				visible = true
				if floor(_portalID.image_index) >= 4
					finished = true
			}
		}
	}
	if (finished)
		cutscene_event_end();
}
function cutscene_lapPortal_end()
{
	global.combotime = 60
	with (obj_player) {
		visible = true;
		state = states.freefall;
		sprite_index = spr_player_pound;
		movespeed = 0;
		hsp = 0;
		vsp = 0;
		image_speed = 0.35;
	}
	instance_create(0, 0, obj_lap2visual)
	cutscene_event_end();
}