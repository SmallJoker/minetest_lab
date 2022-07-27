minetest.register_craftitem("lab:item", {
	description = "callback item",
	inventory_image = "default_tool_steelaxe.png^[transformR180",
	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_all("on_drop")
		return itemstack
	end,
})

minetest.override_item("default:stone", {
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local inv = player:get_inventory()
		inv:add_item("main", ItemStack("default:stick"))
		print("add")
	end,
})