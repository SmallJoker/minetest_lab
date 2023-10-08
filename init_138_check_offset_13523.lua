minetest.register_decoration({
	name = "DEMO CHECK OFFSET",
	deco_type = "simple",
	place_on = {"default:sand"},
	spawn_by = {"default:sand"},
	fill_ratio = 10,
	decoration = "default:wood",
	check_offset = 1,
	height = 10,
	num_spawn_by = 5,
})
