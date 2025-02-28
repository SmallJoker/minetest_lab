
core.register_chatcommand("sky", {
	func = function(name)
		local player = core.get_player_by_name(name)
		player:set_sky({
			body_orbit_tilt = 60
		})
	end
})

-- PR 15513
core.register_chatcommand("t", {
    func = function(name)
        local player = core.get_player_by_name(name)
        core.spawn_tree(player:get_pos(), {
		axiom = "TT",
		trunk = "mapgen_tree",
		leaves = "mapgen_stone"
	})
    end,
})