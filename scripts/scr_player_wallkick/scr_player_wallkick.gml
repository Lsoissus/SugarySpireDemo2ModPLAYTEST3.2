function scr_player_wallkick(){
	// basic movement
	move = key_right + key_left;
	hsp = movespeed
	
	// movespeed control
	 if ((move != 0))
            movespeed = approach(movespeed, (move * 12), 1.5)
        else
            movespeed = approach(movespeed, 0, 0.6)
	
	 if ((kickclimbbuffer > 0))
            kickclimbbuffer--
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
			kickclimbbuffer = 0
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
			kickclimbbuffer = 0
			if key_attack {
				if move != 0
					xscale = move;
				instance_create(x, y, obj_jumpdust);
				audio_stop_sound(sfx_flip)
				sprite_index = spr_mach3;
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
        // wall climb check
		 if (((!grounded) && (move != 0) && (!(place_meeting((x + move), y, obj_metalblock))) && scr_solid((x + move), y, true) && (!(place_meeting((x + move), y, obj_destructibles))) && (!(scr_slope_ext((x + sign(move)), y)))) || (grounded && scr_solid((x + sign(move)), (y - 2), true) && (!(scr_slope_ext((x + sign(move)), (y - 1)))) && (!(place_meeting((x + move), y, obj_metalblock))) && (!(place_meeting((x + move), y, obj_destructibles))) && scr_slope() && (kickclimbbuffer == 0)))
        {
            wallspeed = clamp(abs(movespeed), 12, 24)
            mach2 = 100
            state = states.climbwall
            if ((move != 0))
                xscale = move
            if ((movespeed > 8))
                movespeed -= 0.1
            image_speed = 0.35
            grabclimbbuffer = 5
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