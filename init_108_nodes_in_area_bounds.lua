core.register_chatcommand("bounds", {
	func = function(name, param)
		local areamin = vector.new(-32492, -32508, 32752)
		local areamax = vector.new(32508, -32492, 32768)
		local x = minetest.find_nodes_in_area(areamin, areamax, "air")
		print("aa", dump(x))
	end,
})
