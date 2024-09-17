minetest.register_chatcommand("move", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local val = minetest.is_yes(param) and 1 or 0

		player:set_physics_override({
			speed = val,
		})
		return true, "Changed to " .. tostring(val)
    end
})

minetest.register_chatcommand("kickme", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)

		player:add_velocity({
			x = 10,
			y = 50,
			z = 0
		})
		return true, "OK"
    end
})
