minetest.register_on_joinplayer(function(player)
	player:set_physics_override({
		sneak_glitch = true,
		sneak = true,
		new_move = true,
		jump = 2,
	})
end)
