with (obj_player)
{
	if (room == rank_room)
	{
		obj_player.x = 480;
		obj_player.y = 270;
	}
}
obj_camera.visible = false;
if (fadealpha > 1)
{
	fadein = true;
	if (room != rank_room)
		room_goto(rank_room);
}
if (!fadein)
	fadealpha += 0.1;
else if (fadein == 1)
	fadealpha -= 0.1;
if (bgfadein)
	bgalpha += 0.1;
val++