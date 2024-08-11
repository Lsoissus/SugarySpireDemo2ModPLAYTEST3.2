condition = function()
{
    return (place_meeting(x, y, obj_player) && (obj_player.state == (72 << 0)));
}

output = function()
{
    inst_43C1AAD7.alarm[1] = 5
    inst_76F4DFEA.alarm[1] = 10
    inst_5B1E185C.alarm[1] = 1
	inst_367DAFC.alarm[1] = 1
}
