minetest.register_decoration({
	name = "test1",
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:sand", "default:desert_sand"},
	fill_ratio = 1,
	decoration = "default:cobble",
})
minetest.register_decoration({
	name = "test2",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:sand", "default:desert_sand"},
	fill_ratio = 1,
	schematic = {
        size = {x = 1, y = 3, z = 1},
        data = {
            {name = "default:glass", param1 = 255, param2 = 0},
            {name = "default:glass", param1 = 255, param2 = 0},
            {name = "default:glass", param1 = 255, param2 = 0},
        },
    },
})
minetest.register_decoration({
	name = "test2",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:sand", "default:desert_sand"},
	fill_ratio = 1,
	schematic = {
        size = {x = 1, y = 1, z = 1},
        data = {
            {name = "default:stone", param1 = 255, param2 = 0},
        },
    },
})
