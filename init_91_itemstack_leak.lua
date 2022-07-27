minetest.register_chatcommand("book", {
	func = function(name)
		local itemstack = ItemStack("unknown:book")
		local meta = itemstack:get_meta()
		meta:set_string("infotext", "lorem \\ ipsum * 5k")
		meta:set_string("baz", string.rep("lorem\\\r\nipsum ", 5000) .. math.random())
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		inv:add_item("main", itemstack)
	end
})