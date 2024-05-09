draw_set_halign(fa_center);
draw_set_font(global.font);
draw_option(150, 30, "BACK", optionselected == audio_selected.back);
draw_option(480, 100, "MASTER GAIN", optionselected == audio_selected.master);
draw_option(480, 150, string(round(optionsaved_masterVolume * 100)), optionselected == audio_selected.master);
draw_option(480, 200, "MUSIC GAIN", optionselected == audio_selected.music);
draw_option(480, 250, string(round(optionsaved_musicVolume * 100)), optionselected == audio_selected.music);
draw_option(480, 300, "SFX GAIN", optionselected == audio_selected.sfx);
draw_option(480, 350, string(round(optionsaved_soundVolume * 100)), optionselected == audio_selected.sfx);
draw_set_font(global.smallfont);
draw_text(480, 512, subtitle);
