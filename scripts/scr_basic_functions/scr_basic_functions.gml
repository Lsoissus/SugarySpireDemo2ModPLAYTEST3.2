function approach(_val1, _val2, _amount)
{
	return _val1 + clamp(_val2 - _val1, -_amount, _amount);
}
function chance(_chance)
{
	return _chance > random(1);
}
function wave(_val1, _val2, _val3, _val4)
{
	var a4 = (_val2 - _val1) * 0.5;
	return _val1 + a4 + (sin((((current_time * 0.001) + (_val3 * _val4)) / _val3) * 6.283185307179586) * a4);
}
function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5)
{
    return ((abs((argument0 - argument2)) <= argument4) && (abs((argument1 - argument3)) <= argument5));
}
function try_solid(argument0, argument1, argument2, argument3)
{
    var old_x = x
    var old_y = y
    var n = -1
    var cam_speed = 4
    var i = 0
    while ((i < argument3))
    {
        x += argument0
        y += argument1
        if (!(scr_solid(x, y)))
        {
            n = (i + 1)
            break
        }
        else
            i++
    }
    x = old_x
    y = old_y
    return n;
}

function ledge_bump(argument0, argument1)
{
    if ((argument1 == undefined))
        argument1 = 4
    var old_x = x
    var old_y = y
    x += (xscale * argument1)
    var ty = try_solid(0, -1, obj_solid, argument0)
    x = old_x
    if ((ty != -1))
    {
        y -= ty
        x += xscale
        if scr_solid(x, y)
        {
            x = old_x
            y = old_y
            return true;
        }
        return false;
    }
    return true;
}
function wrap(_value, _val1, _val2)
{
	var value = floor(_value);
	var _min = floor(min(_val1, _val2));
	var _max = floor(max(_val1, _val2));
	var range = (_max - _min) + 1;
	return ((((value - _min) % range) + range) % range) + _min;
}
function animation_end(_image_index = floor(image_index), _endpoint = image_number - 1)
{
	return _image_index >= _endpoint;
}
function rank_checker(_rank = global.rank)
{
	var value = 0;
	switch (_rank)
	{
		case "e":
			value = 6;
			break;
		case "p":
			value = 5;
			break;
		case "s":
			value = 4;
			break;
		case "a":
			value = 3;
			break;
		case "b":
			value = 2;
			break;
		case "c":
			value = 1;
			break;
		case "d":
			value = 0;
			break;
	}
	return value;
}
function string_extract(_str, _substr, _times)
{
	var len = string_length(_substr) - 1;
	repeat (_times)
		_str = string_delete(_str, 1, string_pos(_substr, _str) + len);
	_str = string_delete(_str, string_pos(_substr, _str), string_length(_str));
	return _str;
}
function create_small_number(_x, _y, _value, _color = 0)
{
	var _smallnumber = instance_create(_x, _y, obj_smallnumber);
	with (_smallnumber)
	{
		number = string(_value);
		color = _color;
	}
	return _smallnumber;
}
function string_get_split(_string, _split)
{
	var slot = 0;
	var splits = [];
	var str2 = "";
	for (var i = 1; i < (string_length(_string) + 1); i++)
	{
		var currStr = string_char_at(_string, i);
		if (currStr == _split)
		{
			if (str2 != "")
			{
				splits[slot] = str2;
				slot++;
			}
			str2 = "";
		}
		else
		{
			str2 = str2 + currStr;
			splits[slot] = str2;
		}
	}
	if (str2 == "")
		splits[slot] = str2;
	return splits;
}
