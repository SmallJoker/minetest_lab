minetest.register_on_joinplayer(function(player)
	minetest.show_formspec(player:get_player_name(), "fs_bug_test:stage_one", "field[proceed;Stage one!;close this]")
end)

minetest.register_on_player_receive_fields(function(player, fields)
	minetest.show_formspec(player:get_player_name(), "fs_bug_test:stage_two", "field[proceed2;Stage two!;yay]")
end)
