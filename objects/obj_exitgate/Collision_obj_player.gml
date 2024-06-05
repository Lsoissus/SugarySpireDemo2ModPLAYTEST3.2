if (global.panic)
{
	with (obj_player)
	{
		if (grounded && key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3))
		{
			targetDoor = "none";
			if (global.collect >= global.srank)
				global.rank = "s";
			else if (global.collect > global.arank)
				global.rank = "a";
			else if (global.collect > global.brank)
				global.rank = "b";
			else if (global.collect > global.crank)
				global.rank = "c";
			else
				global.rank = "d";
			if (global.rank == "s")
				scr_sound(mu_ranks);
			if (global.rank == "a")
				scr_sound(mu_ranka);
			if (global.rank == "b")
				scr_sound(mu_rankb);
			if (global.rank == "c")
				scr_sound(mu_rankc);
			if (global.rank == "d")
				scr_sound(mu_rankd);
			if (global.rank == "e")
				scr_sound(mu_rankd);
			audio_stop_sound(mu_escape);
			ini_open("saveData.ini");
			if (room == mines_1)
			{
				if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", "mines", "none")))
					ini_write_string("Ranks", "mines", global.rank);
				if (rank_checker(global.collect) > rank_checker(ini_read_string("Scores", "mines", "none")))
					ini_write_string("Scores", "mines", global.collect);
				if (rank_checker(global.secretsfound) > rank_checker(ini_read_string("Secrets", "mines", "none")))
					ini_write_string("Secrets", "mines", global.secretsfound);
				if (rank_checker(global.mallowfollow) > rank_checker(ini_read_string("Confecti", "minesMallow", "none")))
					ini_write_string("Confecti", "minesMallow", global.mallowfollow);
				if (rank_checker(global.chocofollow) > rank_checker(ini_read_string("Confecti", "minesChoco", "none")))
					ini_write_string("Confecti", "minesChoco", global.chocofollow);
				if (rank_checker(global.crackfollow) > rank_checker(ini_read_string("Confecti", "minesWorm", "none")))
					ini_write_string("Confecti", "minesWorm", global.crackfollow);
				if (rank_checker(global.wormfollow) > rank_checker(ini_read_string("Confecti", "minesWorm", "none")))
					ini_write_string("Confecti", "minesWorm", global.wormfollow);
				if (rank_checker(global.candyfollow) > rank_checker(ini_read_string("Confecti", "minesCandy", "none")))
					ini_write_string("Confecti", "minesCandy", global.candyfollow);
				if (rank_checker(global.janitor) > rank_checker(ini_read_string("Confecti", "minesRudy", "none")))
					ini_write_string("Confecti", "minesRudy", global.janitor);
			}
			if (room == molasses_1)
			{
				if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", "molasses", "none")))
					ini_write_string("Ranks", "molasses", global.rank);
				if (global.collect > ini_read_string("Scores", "molasses", "none"))
					ini_write_string("Scores", "molasses", global.collect);
				if (global.secretsfound > ini_read_string("Secrets", "molasses", "none"))
					ini_write_string("Secrets", "molasses", global.secretsfound);
				if (global.mallowfollow == true)
					ini_write_string("Confecti", "molassesMallow", global.mallowfollow);
				if (global.chocofollow == true)
					ini_write_string("Confecti", "molassesChoco", global.chocofollow);
				if (global.crackfollow == true)
					ini_write_string("Confecti", "molassesWorm", global.crackfollow);
				if (global.wormfollow == true)
					ini_write_string("Confecti", "molassesWorm", global.wormfollow);
				if (global.candyfollow == true)
					ini_write_string("Confecti", "molassesCandy", global.candyfollow);
				if (global.janitor == true))
					ini_write_string("Confecti", "molassesRudy", global.janitor);
			}
			if (room == steamy_1)
			{
				if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", "steamy", "none")))
					ini_write_string("Ranks", "steamy", global.rank);
				if (global.collect > ini_read_string("Scores", "steamy", "none"))
					ini_write_string("Scores", "steamy", global.collect);
									if (global.secretsfound > ini_read_string("Secrets", "steamy", "none"))
					ini_write_string("Secrets", "steamy", global.secretsfound);
				if (rank_checker(global.mallowfollow) > rank_checker(ini_read_string("Confecti", "steamyMallow", "none")))
					ini_write_string("Confecti", "steamyMallow", global.mallowfollow);
				if (rank_checker(global.chocofollow) > rank_checker(ini_read_string("Confecti", "steamyChoco", "none")))
					ini_write_string("Confecti", "steamyChoco", global.chocofollow);
				if (rank_checker(global.crackfollow) > rank_checker(ini_read_string("Confecti", "steamyWorm", "none")))
					ini_write_string("Confecti", "steamyWorm", global.crackfollow);
				if (rank_checker(global.wormfollow) > rank_checker(ini_read_string("Confecti", "steamyWorm", "none")))
					ini_write_string("Confecti", "steamyWorm", global.wormfollow);
				if (rank_checker(global.candyfollow) > rank_checker(ini_read_string("Confecti", "steamyCandy", "none")))
					ini_write_string("Confecti", "steamyCandy", global.candyfollow);
				if (rank_checker(global.janitor) > rank_checker(ini_read_string("Confecti", "steamyRudy", "none")))
					ini_write_string("Confecti", "steamyRudy", global.janitor);
			}
			if (room == entryway_1)
			{
				if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", "entryway", "none")))
					ini_write_string("Ranks", "entryway", global.rank);
				if (rank_checker(global.collect) > rank_checker(ini_read_string("Scores", "entryway", "none")))
					ini_write_string("Scores", "entryway", global.collect);
									if (rank_checker(global.secretsfound) > rank_checker(ini_read_string("Secrets", "entryway", "none")))
					ini_write_string("Secrets", "entryway", global.secretsfound);
				if (rank_checker(global.mallowfollow) > rank_checker(ini_read_string("Confecti", "entrywayMallow", "none")))
					ini_write_string("Confecti", "entrywayMallow", global.mallowfollow);
				if (rank_checker(global.chocofollow) > rank_checker(ini_read_string("Confecti", "entrywayChoco", "none")))
					ini_write_string("Confecti", "entrywayChoco", global.chocofollow);
				if (rank_checker(global.crackfollow) > rank_checker(ini_read_string("Confecti", "entrywayWorm", "none")))
					ini_write_string("Confecti", "entrywayWorm", global.crackfollow);
				if (rank_checker(global.wormfollow) > rank_checker(ini_read_string("Confecti", "entrywayWorm", "none")))
					ini_write_string("Confecti", "entrywayWorm", global.wormfollow);
				if (rank_checker(global.candyfollow) > rank_checker(ini_read_string("Confecti", "entrywayCandy", "none")))
					ini_write_string("Confecti", "entrywayCandy", global.candyfollow);
				if (rank_checker(global.janitor) > rank_checker(ini_read_string("Confecti", "entrywayRudy", "none")))
					ini_write_string("Confecti", "entrywayRudy", global.janitor);
			}
			ini_close();
			obj_tv.tvsprite = spr_tvoff;
			if (!instance_exists(obj_endlevelfade))
			{
				instance_create(x, y, obj_endlevelfade);
				if (state != states.door)
				{
					sprite_index = spr_lookdoor;
					state = states.door;
					obj_endlevelfade.alarm[0] = 235;
					image_index = 0;
				}
			}
			global.panic = false;
		}
	}
}
