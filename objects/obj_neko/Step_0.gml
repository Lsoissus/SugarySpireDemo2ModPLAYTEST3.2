/// @description Update NekoPresence so async events will execute.

np_update();

if ready {
    // initialize temporary variables
    var rpcrank = "D";
    
    // check what rank the player has
    if (global.collect > global.crank && global.collect < global.brank)
        rpcrank = "C";
    else if (global.collect > global.brank && global.collect < global.arank)
        rpcrank = "B";
    else if (global.collect > global.arank && global.collect < global.srank)
        rpcrank = "A";
    else if (global.collect > global.srank)
        rpcrank = (scr_isprank() ? "P" : "S");
        
    // check for if the game isn't paused
    if (!obj_pause.pause)
    {
        var roomname = room_get_name(room);
        if (room != realtitlescreen && room != scootercutsceneidk && room != palroom && room != rank_room && !string_starts_with(roomname, "hub") && !string_starts_with(roomname, "outer") && !string_starts_with(roomname, "spire")) {
            state = $"{global.collect} Points | {global.combo} Combo";
            small_image = $"rank{string_lower(rpcrank)}";
            small_image_text = $"Rank {rpcrank}";
        }
        else if (room == rank_room) {
            state = "";
            small_image = $"rank{string_lower(rpcrank)}";
            small_image_text = $"Rank {rpcrank}";
        }
        else {
            state = "";
            small_image = "";
            small_image_text = "";
        }
    }
    
    // update neko presence
    np_setpresence_more(small_image_text, large_image_text, false);
    np_setpresence(state, details, large_image, small_image);
}