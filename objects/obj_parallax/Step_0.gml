global.ScrollOffset++;
for (var i = 0; i < array_length(layers); i++)
{
	if (layers[i] != undefined)
	{
		with (layers[i])
		{
			var x_pos = layer_xoffset + layer_xshift;
			var y_pos = layer_yoffset + layer_yshift;
			var parallax_value = parallax_layer(layer_id);
			layer_xshift += layer_xspeed;
			layer_yshift += layer_yspeed;
			layer_x(layer_id, parallax_value[0] + x_pos);
			layer_y(layer_id, parallax_value[1] + y_pos);
			layer_background_speed(layer_id, layer_image_speed);
		}
	}
}

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var lay_arr = layer_get_all();
for (var i = 0; i < array_length(lay_arr); i++)
{
	var lay = lay_arr[i];
	var lay_name = layer_get_name(lay);
	switch lay_name
	{
		case "Assets_BG1":
			layer_x(lay, _cam_x * 0.1);
			layer_y(lay, _cam_y * 0.1);
		break;
	}
}
