function scr_player_wallkick(){
	// basic movement
	move = key_right + key_left;
	hsp = move * movespeed;
	
	// movespeed control
	movespeed += abs(move);
	if move == 0
		movespeed -= 0.5
	movespeed = min(movespeed, 8)
	
	// gravity control
	if ((vsp <= 0)) {
		if key_jump2
			grav = 0.3;
		else
			grav = 0.5;
	}
	if (vsp > 0) {
		grav += 0.05;
		grav = min(grav, 5)
	}
	if key_down {
		grav = max(grav, 7.5)
	}
	
	// sprite check
	if sprite_index == spr_player_wallkick && animation_end()
		sprite_index = spr_player_wallkickloop
	
	if sprite_index == spr_player_wallkickloop {
		if !audio_is_playing(sfx_flip)
			scr_sound(sfx_flip)
		// cancel wallkick
		if (key_slap2 || key_attack2)
		{
			if move != 0
				xscale = move;
			instance_create(x, y, obj_jumpdust);
			sprite_index = spr_player_airkickstart
			image_index = 0;
			state = states.mach3
			vsp = -5
			audio_stop_sound(sfx_flip)
			scr_sound(sound_suplex1)
			movespeed = 12;
			mach2 = 100;
		   with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale
		}
		// grounded check
		else if (grounded && vsp >= 0)
		{
			if key_attack {
				if move != 0
					xscale = move;
				instance_create(x, y, obj_jumpdust);
				audio_stop_sound(sfx_flip)
				sprite_index = spr_player_mach3;
				state = states.mach3
				movespeed = 12;
				mach2 = 100;
			}
			else {
				state = states.normal;
				movespeed = 0;
				mach2 = 0;
			}
		}

		// enemy stomp check
		var stompfoe = instance_place(x, (y + vsp), obj_baddie)
	    if stompfoe
	    {
	        instance_destroy(stompfoe)
	        vsp = -10
	    }
	}
if sprite_index = spr_player_wallkickloop
image_speed = 0.35
else if sprite_index = spr_player_wallkick
image_speed = 0.5
}