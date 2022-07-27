-- https://github.com/minetest/minetest/issues/10377

minetest.register_on_player_hpchange(function(player, hp_change, reason)
	print(player:get_player_name(), "hpchange", "change=" .. hp_change .. " reason=" .. reason.type)
end, false)

minetest.register_on_punchplayer(function(player, _, _, _, _, damage)
	print(player:get_player_name(), "punch   ", "change=" .. -damage)
end)
