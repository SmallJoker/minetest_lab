
core.register_chatcommand("dirt", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local pos = player:get_pos()
		pos.y = pos.y
		minetest.place_node(pos, {name = "default:dirt", param2 = 3})
	end
})
