-- For https://github.com/luanti-org/minetest_game/pull/3208

-- Use water as fuel
core.register_craft({
	type = "fuel",
	recipe = "default:water_source",
	burntime = 3.0,
	replacements = {{"default:water_source", "default:cobble"}},
})

-- Cook an apple into 1x coal + 1x stick
core.register_craft({
	type = "cooking",
	recipe = "default:apple",
	output = "default:stick",
	cooktime = 1.0,
	replacements = {{"default:apple", "default:coal_lump"}},
})
