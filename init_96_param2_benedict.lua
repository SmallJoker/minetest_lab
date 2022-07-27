minetest.register_node("lab:decorative", {
	drawtype = "glasslike_framed",
	tiles = {"default_cobble.png", "blank.png"},
	special_tiles = {{
		name = "default_lava.png",
	}},
	paramtype2 = "glasslikeliquidlevel",
	groups = {cracky = 2},
	place_param2 = 63,
})
