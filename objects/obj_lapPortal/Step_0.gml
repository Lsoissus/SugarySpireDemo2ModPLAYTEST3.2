image_alpha = (global.panic ? 1 : 0.5);
/*if global.panic
{
    if (sprite_index == spr_lapportal && place_meeting(x, y, obj_player))
    {
        with (obj_player)
        {
			// play the sound for entering a new lap
			scr_sound(sound_lapenter);

			// lock camera
			with (obj_camera)
				lock = true;

			// set player state
			state = states.actor;
			
			// set player position
			x = other.x;
			y = other.y;

			// set player speed
            hsp = 0;
            vsp = 0;
			
			// set player visibility
            visible = false;

			// enable lapping
			global.lap = true
			
			// lap 2
			if (ds_list_find_index(global.saveroom, other.id) == -1)
			{
				ds_list_add(global.saveroom, other.id);
				global.collect += 3000;
				global.combotime = 60;
				with (instance_create(x, y, obj_smallnumber))
					number = string(3000);
			}
			
			// infinite lapping
			if (global.inflap && global.laps >= 1)
			{
				global.collect += 100;
				global.combotime = 60;
				create_small_number(x, y, "100");
				global.minutes += 1;
				global.seconds += 15;
			}
		}

		image_index = 0;
		sprite_index = spr_lapportalenter
	}
	if sprite_index == spr_lapportalenter && animation_end() {
		visible = false;
		if (!instance_exists(obj_fadeout))
		{
			with (obj_player)
			{
				targetDoor = "LAP"
				targetRoom = other.targetRoom
			}
			global.laps++;
			instance_create(0, 0, obj_fadeout);
		}
	}
}
*/
if sprite_index = spr_lapportalempty && animation_end()
sprite_index = spr_lapportal