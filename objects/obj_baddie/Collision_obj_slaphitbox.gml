if (object_index != obj_charcherry)
{
	scr_sound(sound_slaphit);
	instance_create(x + (obj_player.xscale * 40), y, obj_punchdust);
	if (!global.cane)
	{
		with (obj_player)
		{
			suplexhavetomash = 5;
			sprite_index = spr_grab;
			baddiegrabbedID = other.id;
			state = states.grab;
			sprite_index = spr_player_haulingstart;
			image_index = 0;
		}
		state = baddiestates.grabbed;
		instance_destroy(other.id);
	}
	else
	{
		state = baddiestates.stun;
		hp -= 1;
		thrown = true;
		hsp = obj_player.xscale * 15;
		vsp = -6;
		with obj_player {
			hsp = 0;
			vsp = 0;
			sprite_index = spr_canehit;
			state = states.finishingblow;
		}
	}
}
