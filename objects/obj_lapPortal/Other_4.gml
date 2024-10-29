//New Door Trigger Code.
with (instance_place(x, y, obj_doortrigger_parent)) {
	other.targetDoor = id_door;
}

if (ds_list_find_index(global.saveroom, id) != -1) {
	instance_destroy()
}