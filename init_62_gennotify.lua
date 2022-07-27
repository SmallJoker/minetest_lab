NAME = minetest.get_current_modname()
minetest.register_node(NAME .. ":sapling", {
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "meshoptions",
	description = "Tree sapling",
	groups = { fauna = 1 },
	inventory_image = NAME .. ":sapling",
	node_dig_prediction = "air",
	tiles = { "default_junglegrass.png^[colorize:#6DD" },
	walkable = false,
	buildable_to = true
})
minetest.register_decoration({
	name = "foobar",
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	decoration = NAME .. ":sapling",
	height = 1,
	fill_ratio = 0.5,
	param2 = 0,
	param2_max = 4
})

local decoid = minetest.get_decoration_id("foobar")

local make_trees = function(min_pos, max_pos, _)
	local notification = minetest.get_mapgen_object("gennotify")


	-- TODO call make_tree for each sappling
end

minetest.set_gen_notify({decoration = true}, {decoid})

minetest.register_on_generated(make_trees)