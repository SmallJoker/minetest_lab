minetest.register_on_punchplayer(function(player, hitter)
	hitter:set_attach(player, "", {x=0, y=6, z=-3}, vector.new())
end)