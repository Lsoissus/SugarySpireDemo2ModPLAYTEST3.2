scr_getinput();
scr_characterspr();
scr_playerstate();
if (state != states.comingoutdoor)
	image_blend = make_color_hsv(0, 0, 255);
// create fire trail
if (firetrailbuffer > 0)
	firetrailbuffer -= ((movespeed / 24) * 26);
if (firetrailbuffer <= 0)
{
	if (movespeed >= 12 &&
	(state == states.mach2 ||
	state == states.mach3 ||
	state == states.machroll))
		instance_create(x, y, obj_flamecloud);
	firetrailbuffer = 100;
}
// slope rotation
if (global.playerrotate)
{
	if (grounded &&
	vsp >= 0 &&
	!(state == states.climbwall ||
	state == states.tumble ||
	state == states.grab ||
	state == states.freefallland ||
	state == states.shotgun ||
	state == states.finishingblow ||
	state == states.minecart))
	{
		// if going fast enough then enable slope rotation
		if (abs(hsp) >= 8)
		{
			var targetangle = scr_slopeangle();
			var RotationStep = (((abs(hsp) / 16) + (abs(hsp) / 32)) - 2) * -1;
		}
		else
		{
			// selse set the target rotation to normal
			targetangle = 360;
			RotationStep = ((abs(hsp) / 16) - 2) * -1;
		}
		// the rotation that is used in the draw event
		draw_angle = darctan2(dsin(targetangle) + (dsin(draw_angle) * RotationStep), dcos(targetangle) + (dcos(draw_angle) * RotationStep));
	}
	else
	{
		// if angle is less than or equal to 0 then add 360 degrees to the angle
		if (draw_angle <= 0)
			draw_angle += 360;
		
		if (draw_angle < 180) // if its below 180 then check set draw angle to the highest value
			draw_angle = max(draw_angle - 2.8125, 0);
		else // else set the draw angle to the lowest value
			draw_angle = min(draw_angle + 2.8125, 360);
	}
}
// if inside a room that could be considered a titlescreen, set your state to states.titlescreen
if (room == realtitlescreen || room == scootercutsceneidk)
	state = states.titlescreen;
// if grounded normally, set grounded for the cotton transformation
if (grounded)
	groundedcot = grounded;
// if not losing or going into a vertical hallway then execute checkpoint related code
if (state != states.gameover &&
y > (room_height + 64) &&
!place_meeting(x, y, obj_vertical_hallway) &&
!instance_exists(obj_fadeout) &&
room != outer_room2)
{
	if (instance_exists(obj_checkpoint))
	{
		// get the nearest checkpoint and set player position to it
		var _checkpoint = instance_nearest(x, y, obj_checkpoint);
		x = _checkpoint.x;
		y = _checkpoint.y;
		instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
		// technical difficulties screen.
		scr_sound(sfx_TVswitch)
        instance_create(x, y, obj_technicaldifficulties)
	}
	else
	{
		// else set player position to start of room
        x = roomstartx
        y = roomstarty
		// technical difficulties screen.
        scr_sound(sfx_TVswitch)
        instance_create(x, y, obj_technicaldifficulties)
	}
	// if the train exists, initialize its position and vars
	if (instance_exists(obj_train))
	{
		with (obj_train)
		{
			x = xstart;
			y = ystart;
			movespeed = 10;
			image_index = 0;
			sprite_index = spr_spray;
			go = false;
		}
	}
}
if (state != states.door && (!instance_exists(obj_fadeout)))
{
	// reset door related vars
    obj_player.hallway = 0
    obj_player.vertical = 0
    obj_player.box = 0
}
// freefall stuff
if (state != states.freefall && state != states.freefallprep && state != states.freefallland)
	freefallsmash = 0;
// if holding enemy and said enemy dies, set state to normal
if (!instance_exists(baddiegrabbedID) &&
(state == states.grab ||
(state == states.superslam &&
sprite_index != spr_piledriverland) ||
state == states.charge))
	state = states.normal;
// if not grabbing or any of these enemy-killing states, set the grabbed baddie to nothing
if (!(state == states.grab || state == states.charge || state == states.superslam || state == states.finishingblow))
	baddiegrabbedID = undefined;
// if pizzelle do angry related things
if (character == characters.pizzelle)
{
	angry = sign(anger);
	// if anger above 0 then tick it down
	if (anger > 0)
		anger--;
	// create the angry cloud when angry
	if (angry && !instance_exists(obj_angrycloud) && obj_player.state == states.normal)
		instance_create(x, y, obj_angrycloud);
}
// set angry sprite
if (angry && sprite_index == spr_idle)
	sprite_index = spr_player_3hpidle;
// initalize player sound control down here for some reason
scr_playersounds();
// if sprite is set to the winding idle sprite and state is changed, set the animation counter to 0
if (sprite_index == spr_player_winding && state != states.normal)
	windingAnim = 0;
else
	audio_stop_sound(sound_superjumpcharge2); // stop this sound for some reason
// when hitting the ground while suplexed, enable the flash and set suplexing to false;
if (suplexmove && grounded)
{
	suplexmove = false;
	flash = true;
}
// gravity
if (is_undefined(grav))
	grav = 0.5;
// combo stuff
global.combotime = clamp(global.combotime, 0, 60);
// if combo isnt frozen, make combo go down.
if (global.combofreeze <= 0)
	global.combotime = approach(global.combotime, 0, 0.13);

// tick down combofreeze and make sure it doesnt go below 0
global.combofreeze--;
global.combofreeze = clamp(global.combofreeze, 0, 75);
// combo end logic
if (global.combotime <= 0 && global.combo != 0)
{
	// if combo at the end of the combo is above 5, queue the happy tvanim
	if (global.combo > 5)
		scr_queue_tvanim(spr_pizzytvhappy, 200);
	// reset combo related vars and drop the combo
	global.combo = 0;
	global.combodropped = true;
}
// input buffering
if (input_buffer_jump < 8)
	input_buffer_jump++;
// key particles
if (key_particles)
	instance_create(random_range(x + 25, x - 25), random_range(y + 35, y - 25), obj_keyeffect);
// if you have no invincibility frames and arent hurt set alpha to 1
if (inv_frames == 0 && !hurted)
	image_alpha = 1;
if (state == states.mach2 ||
state == states.charge ||
state == states.skateboard ||
state == states.knightpep ||
state == states.boxxedpep ||
state == states.cheesepep ||
state == states.knightpepslopes ||
state == states.knightpepattack ||
state == states.bombpep ||
state == states.facestomp ||
state == states.shotgun ||
state == states.facestomp ||
state == states.machroll ||
state == states.mach3 ||
state == states.freefall ||
state == states.Sjump)
	attacking = true; // enable killing of baddies
else
	attacking = false;
if (state == states.throwing ||
state == states.punch ||
state == states.backkick ||
state == states.shoulder ||
state == states.uppunch)
	grabbing = true; // grabbing baddies
else
	grabbing = false;
// if any of these states or piledriving 
if ((state == states.mach3 ||
state == states.machtumble ||
state == states.minecart ||
state == states.fireass ||
state == states.puddle ||
state == states.hookshot ||
state == states.skateboard ||
state == states.timesup ||
state == states.freefall ||
state == states.Sjump ||
state == states.machroll ||
state == states.shotgun ||
state == states.charge ||
(state == states.superslam &&
sprite_index == spr_piledriver) ||
(state == states.superslam &&
sprite_index == spr_player_piledriverstart) ||
state == states.knightpep ||
state == states.knightpepattack ||
state == states.knightpepslopes ||
state == states.boxxedpep ||
state == states.cheesepep ||
state == states.cheeseball) ||
state == states.uppercut)
	instakillmove = true; // another baddie killing check
else
	instakillmove = false;
// if alarm var is 0 and flashing then execute alarm 0 in a 6th of a second
if (flash && alarm[0] <= 0)
	alarm[0] = 0.15 * room_speed;
// reset falling animation var if not in any jump states
if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
	fallinganimation = false;
// if not in normal state after landing from a freefall, reset the facehurt var
if (state != states.freefallland && state != states.normal && state != states.machslide)
	facehurt = false;
// reset the mach slide animation variable
if (state != states.normal && state != states.machslide)
	machslideAnim = false;
// if not in normal state, reset the idle timer var
if (state != states.normal)
	idle = 0;
if (state != states.mach1 &&
state != states.jump &&
state != states.hookshot &&
state != states.handstandjump &&
state != states.normal &&
state != states.mach2 &&
state != states.mach3 &&
state != states.freefallprep &&
state != states.knightpep &&
state != states.shotgun &&
state != states.knightpepslopes)
	momemtum = false; // if not any of these states remove momentum
//if (state != states.Sjump && state != states.Sjumpprep)
//	a = 0;

// set the animation vars to true or false depending if in the state or not
if (state != states.facestomp)
	facestompAnim = false;
if (state != states.mach2)
	machpunchAnim = false;
if (state != states.jump)
	stompAnim = false;
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
	superslam = 0;
// reset ladder buffer if not jumping
if (state != states.jump)
	ladderbuffer = 0;

// tick down alarm
if (toomuchalarm1 > 0)
	toomuchalarm1--;
// if alarm is over and are in any of these states, enable mach3 afterimages
if (toomuchalarm1 <= 0 &&
(state == states.mach3 ||
state == states.hookshot ||
state == states.mach2 ||
state == states.charge ||
(state == states.machslide &&
mach2 >= 100) ||
state == states.machroll ||
state == states.handstandjump ||
state == states.cottondrill ||
state == states.cottonroll ||
state == states.minecart ||
(state == states.rocketfistpizzano &&
sprite_index != spr_pizzano_sjumpprepside) ||
state == states.pizzanokungfu ||
(state == states.chainsaw &&
mach2 >= 100)))
{
	with (instance_create(x, y, obj_mach3effect))
	{
		playerid = other.object_index;
		image_index = other.image_index - 1;
		image_xscale = other.xscale;
		sprite_index = other.sprite_index;
	}
	toomuchalarm1 = 6;
}
// if not any of these states or sprites, make the collision mask to the default
if (state != states.bump &&
state != states.crouch &&
state != states.boxxedpep &&
state != states.pistol &&
state != states.tumble &&
sprite_index != spr_player_crouchshoot &&
state != states.Sjumpprep &&
state != states.chainsaw &&
state != states.machroll &&
state != states.hurt &&
state != states.crouchslide &&
state != states.crouchjump &&
sprite_index != spr_pizzano_crouchslide)
	mask_index = spr_player_mask;
else
	mask_index = spr_crouchmask; // else if any of the states, set the collsion mask to the crouching mask.
// check if player is in cutscene and set the cutscene var
if (state == states.gottreasure ||
sprite_index == spr_knightpep_start ||
sprite_index == spr_knightpep_thunder ||
state == states.keyget ||
state == states.door ||
state == states.victory ||
state == states.comingoutdoor ||
state == states.gameover)
	cutscene = true;
else
	cutscene = false;
// up arrow check
if (((place_meeting(x, y, obj_door) &&
!place_meeting(x, y, obj_doorblocked)) ||
(place_meeting(x, y, obj_startgate) &&
state != states.victory) ||
place_meeting(x, y, obj_keydoorclock) ||
place_meeting(x, y, obj_keydoor) ||
(place_meeting(x, y, obj_exitgate) &&
global.panic)) &&
!instance_exists(obj_uparrow) &&
scr_solid(x, y + 1) &&
state == states.normal)
	instance_create(x, y, obj_uparrow); // create the up arrow
// mach speedlines check
if ((state == states.mach2 || state == states.mach3) && !instance_exists(obj_speedlines))
	instance_create(x, y, obj_speedlines); // create the speed lines
// if not in taunting state
if (state != states.backbreaker)
{
	// tick up the supertaunt buffer
	if (global.combo >= 3 && supertauntbuffer < 500 && !supertauntcharged)
		supertauntbuffer++;
	// if buffer is high enough
	if (supertauntbuffer >= 500 && !supertauntcharged)
	{
		supertauntbuffer = 500;
		supertauntcharged = true; // give player ability to supertaunt
	}
	// if buffer is less than 0 and can supertaunt and combo is below minimum needed
	if ((supertauntbuffer <= 0 && supertauntcharged) || global.combo < 3)
	{
		supertauntbuffer = 0; // reset buffer
		supertauntcharged = false; // remove ability to supertaunt
	}
	if (supertauntcharged && room != rank_room)
	{
		if (!instance_exists(supertaunteffect))
		{
			with (instance_create(x, y, obj_supertaunteffect))
			{
				other.supertaunteffect = id; // set obj_player.supertaunteffect to this instance
				playerid = other.id;
			}
		}
	}
}
// initialize collision with destructible objects
scr_collide_destructibles();
// if not any of these states then apply collision
if (state != states.titlescreen &&
state != states.door &&
state != states.Sjump &&
state != states.comingoutdoor &&
state != states.boulder &&
state != states.keyget &&
state != states.victory &&
state != states.portal &&
state != states.timesup &&
state != states.gottreasure &&
state != states.gameover &&
state != states.door)
	scr_collide_player();
// if cooldown is above 0 then tick down
if (gumbobpropellercooldown > 0)
	gumbobpropellercooldown--;
// roomsave check
if (state == states.door || place_meeting(x, y, obj_hallway) || state == states.victory)
	global.roomsave = false;
// I dont even know what this is for this might just be jank
if (state == states.finishingblow && !floor(image_index) == (image_number - 1))
{
	with (instance_place(x, y, obj_baddie))
		vsp = 0;
	grav = 0;
}
if (state == states.finishingblow && floor(image_index) == (image_number - 0))
{
	with (instance_place(x, y, obj_baddie))
		vsp = 0.1;
	grav = 0.5;
}
// gravity 2 (squared) (don't mess with this unless you really know what you're doing)
grav = 0.5;
// dashpad buffer
if (Dashpad_buffer > 0)
	Dashpad_buffer = max(Dashpad_buffer - 1, 0);
// after hitting something in mach1, reset back to the default mach1 sprite
if ((sprite_index == spr_player_machpunch1 || sprite_index == spr_player_machpunch2) && animation_end())
	sprite_index = spr_mach;
