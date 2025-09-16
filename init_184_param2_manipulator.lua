local my_param1, my_param2

core.register_tool("lab:override", {
	description = "Use=Set1/2, Place=increase param2 by 1",
	inventory_image = "server_view_mods.png",
	on_use = function(itemstack, user, pointed_thing)
		local pos = pointed_thing.under
		local n = core.get_node(pos)
		n.param1 = my_param1 or n.param1
		n.param2 = my_param2 or n.param2
		core.swap_node(pos, n)
	end,
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.under
		local n = core.get_node(pos)
		n.param2 = n.param2 + 1
		core.swap_node(pos, n)
	end,
})

core.register_chatcommand("p1", {
	func = function(_, param)
		my_param1 = tonumber(param)
		return true, "Set param1 = " .. (my_param1 or "(keep unchanged)")
	end
})

core.register_chatcommand("p2", {
	func = function(_, param)
		my_param2 = tonumber(param)
		return true, "Set param2 = " .. (my_param2 or "(keep unchanged)")
	end
})
