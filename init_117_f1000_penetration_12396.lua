core.register_globalstep(function()
	local player = core.get_player_by_name("singleplayer")
	if player then
		core.get_objects_inside_radius(player:get_pos(), 0.5)
	end
end)

-- 12418

core.register_chatcommand("spoof", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		player:set_pos({
			x = (math.random() - 0.5) * 10000000,
			y = (math.random() - 0.5) * 10000000,
			z = (math.random() - 0.5) * 10000000
		})
	end
})