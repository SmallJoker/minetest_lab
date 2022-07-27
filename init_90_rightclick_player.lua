minetest.register_on_rightclickplayer(function(player, clicker)
	print(player:get_player_name() .. " right clicked player ".. clicker:get_player_name());
	

end)