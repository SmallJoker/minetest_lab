-- Test damage texture restauration
minetest.register_on_joinplayer(function(player)
    player:set_properties{damage_texture_modifier = "^[transformFY"}
end)

-- Check velocity
minetest.register_chatcommand("vel", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local vel = player:get_player_velocity()
		vel = player:get_velocity()

		if param == "x" then
			player:add_velocity({x = 10, y = 0, z = 0})
		elseif param == "y" then
			player:add_velocity({x = 0, y = 10, z = 0})
		elseif param == "z" then
			player:add_velocity({x = 0, y = 0, z = 10})
		elseif param == "d" then
			player:add_velocity(vel)
			player:add_player_velocity(vel)
		end
	end
})