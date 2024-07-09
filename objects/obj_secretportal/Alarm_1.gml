if (exitsecret == true)
{
    obj_player.targetDoor = "SECRET"
    room_goto(targetsecret)
}
else
{
    obj_player.targetDoor = "SECRET"
    room_goto(global.lastroom)
}
