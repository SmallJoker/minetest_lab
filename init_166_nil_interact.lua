
minetest.register_chatcommand("p", {
	func = function(name, param)
		local pos = minetest.get_player_by_name(name):get_pos()

		local node_name = #param > 0 and param or "bones:bones"
		local np = minetest.find_node_near(pos, 4, node_name, true)
		if not np then
			return false, "No node found"
		end
		minetest.punch_node(np)
		return true, "OK!"
	end
})
