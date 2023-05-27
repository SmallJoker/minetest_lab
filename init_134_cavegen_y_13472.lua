minetest.clear_registered_biomes()

minetest.register_biome({
	name = "dirt_plate",
	node_stone  = "basenodes:dirt",
	y_max = -5000,
	y_min = -11000,
	vertical_blend = 0,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "dirt_plate_2",
	node_stone  = "basenodes:ice",
	y_max = -11010,
	y_min = -11020,
	vertical_blend = 0,
	heat_point = 50,
	humidity_point = 50,
})

print("REGISTERED!" .. dump(minetest.registered_biomes))
