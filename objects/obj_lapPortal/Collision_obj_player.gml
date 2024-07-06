if (other.state != states.actor && sprite_index == spr_lapportal && global.panic) {
	with (other) {
		x = other.x;
		y = other.y;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		image_index = 0;
		sprite_index = spr_lapportalenter;
	}
	ini_open("saveData.ini");
	var ranks = ini_read_string("Ranks", string(global.levelname), "none");
	ini_close();
	if (ranks != "p" || !global.inflap) {
		ds_list_add(global.saveroom, id);
	}
	
	cutscene_create([cutscene_lapPortal_start, cutscene_lapPortal_middle, cutscene_lapPortal_end]);
	instance_destroy();
}