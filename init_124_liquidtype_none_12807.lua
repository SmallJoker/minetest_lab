--  (blue) node with liquidtype = "source", display correctly
minetest.register_node(":liquid:type_source", {
	description = ("liquid Source Blue"),
	drawtype = "liquid",
	waving = 3,
	tiles = {"[combine:16x16^[noalpha^[colorize:#229:255"},
	special_tiles = {{name = "[combine:16x16^[noalpha^[colorize:#229:255"},{name = "[combine:16x16^[noalpha^[colorize:#229:255"}},
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = true,
	drowning = 1,
	liquid_range = 1,
	--LIQUID TYPE = SOURCE
	liquidtype = "source",
	liquid_alternative_flowing = "liquid:flow",
	liquid_alternative_source = "liquid:type_source",
	--
	liquid_renewable = false,
	floodable = false
})

-- (red) node with liquidtype = "none", display incorrectly
minetest.register_node(":liquid:liquidtype_none", {
	description = ("liquid None Red"),
	drawtype = "liquid",
	waving = 3,
	tiles = {"[combine:16x16^[noalpha^[colorize:#922:255"},
	special_tiles = {{name = "[combine:16x16^[noalpha^[colorize:#922:255"},{name = "[combine:16x16^[noalpha^[colorize:#922:255"}},
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = true,
	drowning = 1,
	liquid_range = 1,
	--LIQUID TYPE = NONE
	liquidtype = "none",
	--
	liquid_renewable = false,
	floodable = false
})

-- (pink) flowing node provided to avoid error
minetest.register_node(":liquid:flow", {
	description = ("liquid Flow Pink"),
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"[combine:16x16^[noalpha^[colorize:#959:255"},
	special_tiles = {{name = "[combine:16x16^[noalpha^[colorize:#959:255"},{name = "[combine:16x16^[noalpha^[colorize:#959:255"}},
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = true,
	liquid_range = 3,
	liquidtype = "flowing",
	liquid_alternative_flowing = "liquid:flow",
	liquid_alternative_source = "liquid:type_source",
})