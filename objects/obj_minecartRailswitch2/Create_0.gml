depth = 4;
can_collide = function(_obj = obj_player)
{
	if (_obj == obj_player && global.switchblock == true)
	{
		var wow = _obj.state == states.minecart;
		return wow;
	}
	else if ((_obj == obj_minecart || _obj == obj_train) && global.switchblock == true)
		return true;
	else if global.switchblock != true
		return false;
};
