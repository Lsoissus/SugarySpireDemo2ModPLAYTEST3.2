function Approach(argument0, argument1, argument2) //gml_Script_Approach
{
    if (argument0 < argument1)
    {
        argument0 += argument2
        if (argument0 > argument1)
            return argument1;
    }
    else
    {
        argument0 -= argument2
        if (argument0 < argument1)
            return argument1;
    }
    return argument0;
}

function Wave(argument0, argument1, argument2, argument3, argument4) //gml_Script_Wave
{
    if (argument4 == undefined)
        argument4 = -4
    var a4 = (argument1 - argument0) * 0.5
    var t = current_time
    if (argument4 != -4)
        t = argument4
    return (argument0 + a4 + (sin((t * 0.001 + argument2 * argument3) / argument2 * (2 * pi))) * a4);
}

function scr_draw_granny_texture(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_scr_draw_granny_texture
{
    if (argument6 == undefined)
        argument6 = spr_icepopdia
    if (argument7 == undefined)
        argument7 = spr_textbox
    var w = sprite_get_width(argument7) * argument2
    var h = sprite_get_height(argument7) * argument3
    if (!surface_exists(surfclip))
        surfclip = surface_create(w, h)
    if (!surface_exists(surffinal))
        surffinal = surface_create(w, h)
    surface_set_target(surfclip)
    draw_clear_alpha(c_black, 0)
    draw_rectangle_color(0, 0, w, h, c_white, c_white, c_white, c_white, false)
    gpu_set_blendmode(bm_subtract)
    draw_sprite_ext(argument7, 0, 0, 0, argument2, argument3, 0, c_white, 1)
    gpu_set_blendmode(bm_normal)
    surface_reset_target()
    surface_set_target(surffinal)
    draw_sprite_tiled(argument6, 0, argument4, argument5)
    gpu_set_blendmode(bm_subtract)
    draw_surface(surfclip, 0, 0)
    gpu_set_blendmode(bm_normal)
    surface_reset_target()
    draw_surface(surffinal, argument0, argument1)
}

function scr_string_width(argument0) //gml_Script_scr_string_width
{
    var pos = 0
    w = 0
    var originalstr = argument0
    var str_arr = array_create(0)
    while (pos < string_length(originalstr))
    {
        if (string_copy(originalstr, pos, 2) == "\n")
        {
            array_push(str_arr, string_copy(originalstr, 1, pos))
            string_delete(originalstr, 1, pos)
            pos = 0
            if (originalstr == "")
                break
            else
                continue
        }
        else
        {
            pos++
            continue
        }
    }
    if (array_length(str_arr) == 0)
        w = string_width(argument0)
    for (var i = 0; i < array_length(str_arr); i++)
    {
        var b = str_arr[i]
        if (string_width(b) > w)
            w = string_width(b)
    }
    return w;
}

function scr_is_separation(argument0, argument1) //gml_Script_scr_is_separation
{
    for (i = 0; i < array_length(argument1); i++)
    {
        if (argument0 == argument1[i])
            return true;
    }
    return false;
}

function scr_separate_text(argument0, argument1, argument2) //gml_Script_scr_separate_text
{
    if (argument1 != -4)
        draw_set_font(argument1)
    var separation = " "
    separation = string_split(separation, ",")
    while (string_width(argument0) > (argument2 - string_width("a")))
    {
        var _pos = string_length(argument0)
        var _oldpos = _pos
        while (!(scr_is_separation(string_char_at(argument0, _pos), separation)))
        {
            _pos--
            if (_pos < 0)
                _pos = _oldpos
        }
        if (string_char_at(argument0, _pos) == " ")
        {
            argument0 = string_delete(argument0, _pos, 1)
            argument0 = string_insert("\n", argument0, _pos)
        }
        else
            argument0 = string_insert("\n", argument0, (_pos + 1))
    }
    return argument0;
}

function scr_draw_text_fx(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_scr_draw_text_fx
{
    if (argument3 == undefined)
        argument3 = c_white
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = noone
    var cx = argument0
    var cy = argument1
    for (i = 0; i < string_length(argument2); i++)
    {
        b = string_char_at(argument2, (i + 1))
        if (b == ansi_char(10))
        {
            cy += string_height("a")
            cx = argument0
        }
        else
        {
            if (argument5 == 0)
                draw_text_color(cx, cy, b, argument3, argument3, argument3, argument3, argument4)
            else
            {
                switch argument5
                {
                    case 1:
                        var s1 = irandom_range(-1, 1)
                        var s2 = irandom_range(-1, 1)
                        draw_text_color((cx + s1), (cy + s2), b, argument3, argument3, argument3, argument3, argument4)
                        break
                    case 2:
                        var s = 0
                        var o = 1
                        if (argument6 != noone)
                            o = argument6.offset
                        var jinglex = irandom_range(1, -1)
                        var jingley = irandom_range(-1, 1)
                        draw_text_color((cx + jinglex), (cy + jingley), b, argument3, argument3, argument3, argument3, argument4)
                        break
                }

            }
            cx += string_width_ext(b, 0, -1)
        }
    }
}
