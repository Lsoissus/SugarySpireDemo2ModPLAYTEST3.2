draw_self()
if place_meeting(x, y, obj_player)
{
	ini_open("saveData.ini");
levelrank = ini_read_string("Ranks", string(level), "none");
levelscore = ini_read_string("Scores", string(level), "none");
levelmallow = ini_read_string("Confecti", string(level) + "Mallow", "none");
levelchoco = ini_read_string("Confecti", string(level) + "Choco", "none");
levelcrack = ini_read_string("Confecti", string(level) + "Crack", "none");
levelworm = ini_read_string("Confecti", string(level) + "Worm", "none");
levelcandy = ini_read_string("Confecti", string(level) + "Candy", "none");
leveljanitor = ini_read_string("Confecti", string(level) + "Rudy", "none");
levelsecret = ini_read_string("Secrets", string(level), "none");
ini_close();
draw_set_font(global.font)
if levelscore == "" then
levelscore = "0"
if levelsecret == "" then
levelsecret = "0"
	var _offset = random_range(2,-2)
	var _offset2 = random_range(2,-2)
		 draw_text(x + _offset, y + _offset2, string_hash_to_newline(levelscore))
		 draw_text(x + _offset, (y - 200 + _offset2), string_hash_to_newline((string(levelsecret) + " OF 3 SECRET")))
		 if (levelmallow == true)
            draw_sprite(spr_rank_marshmallow, 8, (x - 75), (y - 100))
         else
            draw_sprite(spr_rank_marshmallow_lose, -1, (x - 75), (y - 100))
         if (levelchoco == true)
            draw_sprite(spr_rank_chocolate, 7, (x - 35), (y - 100))
         else
            draw_sprite(spr_rank_chocolate_lose, -1, (x - 35), (y - 100))
         if (levelcrack == true)
            draw_sprite(spr_rank_crack, 8, x, (y - 100))
         else
            draw_sprite(spr_rank_crack_lose, -1, x, (y - 100))
         if (levelworm == true)
            draw_sprite(spr_rank_gummyworm, 8, (x + 35), (y - 100))
         else
            draw_sprite(spr_rank_crack_lose, -1, (x + 35), (y - 100))
         if (levelcandy == true)
            draw_sprite(spr_rank_candy, 8, (x + 75), (y - 100))
         else
            draw_sprite(spr_rank_candy_lose, -1, (x + 75), (y - 100))
	
}