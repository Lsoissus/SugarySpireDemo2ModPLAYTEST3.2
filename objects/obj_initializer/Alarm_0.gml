var len = array_length(tex_list);
if len > 0
{
	var tex = array_pop(tex_list);
	show_debug_message("Loading texture: ", tex);
	if !texture_is_ready(tex)
		texture_prefetch(tex);
}
else
{
	obj_player.state = states.titlescreen;
	room_goto(IS_DEBUG ? devroom : realtitlescreen);
}
alarm[0] = 1;