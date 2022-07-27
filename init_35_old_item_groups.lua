minetest.register_node(":test:node", {
	groups = {bad = 1, good = 1},
})

minetest.override_item("test:node", {
	groups = {good = 1},
})

minetest.register_abm{
	nodenames = {"group:bad"},
	interval = 1,
	chance = 1,
	action = function()
		print("Bad!")
	end,
}

minetest.register_abm{
	nodenames = {"group:good"},
	interval = 1,
	chance = 1,
	action = function()
		print("Good.")
	end,
}