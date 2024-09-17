minetest.register_on_joinplayer(function(player, last_login)
	if #minetest.get_connected_players() >= 2 then

		minetest.handle_async(function(p)
			return p
		end, function(p2)
			minetest.close_formspec(p2, "")
		end, player:get_player_name())
		minetest.kick_player(player:get_player_name())
	end
end)
