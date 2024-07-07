if (obj_player.grounded)
{
	if (!inv_frame && obj_player.state != states.knightpep && obj_player.state != states.cheeseball && obj_player.state != states.boxxedpep && obj_player.state != states.cheesepep && obj_player.state != states.knightpepattack && obj_player.state != states.knightpepslopes && obj_player.state != states.hurt)
	{
		global.key_inv = true;
		obj_player.key_particles = true;
		obj_player.alarm[7] = 30;
	}
	if (!global.keyget && obj_player.state != states.knightpep && obj_player.state != states.knightpepattack && obj_player.state != states.boxxedpep && obj_player.state != states.cheesepep && obj_player.state != states.knightpepslopes)
	{
		scr_sound(sound_toppingot);
		sprite_index = spr_spookey_intro
		with (instance_create(x, y, obj_explosioneffect))
			sprite_index = spr_taunteffect
		obj_player.image_index = 0;
		global.keyget = true;
		scr_queue_tvanim(spr_collectspookey_tv, 200);
	}
}
