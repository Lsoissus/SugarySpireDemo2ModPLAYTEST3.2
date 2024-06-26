with (instance_create(x, y, obj_door))
{
	sprite_index = spr_worlddoor_open;
	visited = true;
	targetDoor = other.targetDoor;
	targetRoom = other.targetRoom;
}
