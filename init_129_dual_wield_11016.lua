minetest.register_chatcommand("poh", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		inv:set_list("offhand", {"lab:eat_on_action"})
	end
})

minetest.register_chatcommand("ph", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		inv:set_list("hand", {"lab:eat_on_action"})
	end
})

minetest.register_chatcommand("fs", {
	func = function(name, param)
		core.show_formspec(name, "lab:testy",
			"size[10,8]"..
			"list[current_player;main;0,2;8,4;]"..
			"list[current_player;offhand;0,0;1,1;]"..
			"list[current_player;hand;5,0;1,1;]"
		)
	end
})

minetest.register_tool("lab:eat_on_action", {
	inventory_image = "default_stick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},

	on_place = minetest.item_eat(1),
	on_secondary_use = minetest.item_eat(1),
	on_use = minetest.item_eat(1),
})
