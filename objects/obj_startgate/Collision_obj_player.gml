var gate = id
if (sprite_index != spr_exitgateclosed)
{
	with (obj_player)
	{
		if (key_up && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor)
		{
			mach2 = 0;
			obj_camera.chargecamera = 0;
			image_index = 0;
			sprite_index = spr_entergate;
			state = states.victory;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			audio_stop_all();
		}
		if animation_end() && (!instance_exists(obj_titlecard)) && sprite_index = spr_entergate
		{
			with (instance_create(x, y, obj_titlecard))
				{
					titlecard_sprite = gate.titlecard_sprite;
					titlecard_index = gate.titlecard_index;
					title_sprite = gate.title_sprite;
					title_index = gate.title_index;
					title_music = gate.title_music;
				}
		}
	}
}
