minetest.register_node("lab:node", {
	description = "testnode",
	tiles = {"default_stone.png"},
	groups = {oddly_breakable_by_hand = 3, snappy = 1},
	on_use = function()
		print("Node Use!")
	end,
	on_secondary_use = function()
		print("Node Secondary use. (air)")
	end,
	on_rightclick = function()
		print("Node Rightclick")
	end,
	on_place = function(...)
		print("Node Place")
		return minetest.item_place(...)
	end
})

minetest.register_entity("lab:entity", {
	initial_properties = {
		hp = 1,
		visual = "cube",
		visual_size = {x = 1, y = 1},
		textures = { "default_stone.png" },
		static_save = false,
	},
	on_rightclick = function()
		print("Entity Rightclick")
	end,
	on_punch = function()
		print("Entity punch")
	end
})