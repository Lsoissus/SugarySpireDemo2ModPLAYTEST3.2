var _player = false
with (obj_player)
{
    if (targetDoor == "P")
    {
		// lap exit exclusive variables
        _player = true;
		other.active = true;

		// set player state
        state = states.actor

		// set player position
        x = other.x
        y = other.y
		
		// set room start postion
        roomstartx = x
        roomstarty = y
		
		// set player visibilty
        visible = false
		
		// set coneball position
        with (obj_coneball)
        {
            x = other.x
            y = other.y
        }
    }
}
if (!_player)
    instance_destroy();