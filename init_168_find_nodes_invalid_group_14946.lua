
minetest.register_chatcommand("p", {
	func = function(name, param)
		local pos = minetest.get_player_by_name(name):get_pos()
		local minp = vector.add(pos, -5)
		local maxp = vector.add(pos,  5)

		--local groupname = "group:stone"
		local groupname = "group:invalidgroupname"
		local names_positions = minetest.find_nodes_in_area(minp, maxp, groupname, true)
		for name, pos in pairs(names_positions) do
			print(name, #pos)
		end
		local positions, counts = minetest.find_nodes_in_area(minp, maxp, groupname, false)
		print(#positions, dump(counts))
		return true, "OK!"
	end
})
