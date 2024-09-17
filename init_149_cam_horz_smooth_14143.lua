
minetest.register_chatcommand("test", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		player:set_look_horizontal(math.pi * 0.1)

		minetest.after(2, function()
			local player = minetest.get_player_by_name(name)
			if not player then
				return
			end
			player:set_look_horizontal(math.pi * (4 - 0.1))
		end)
	end,
})