minetest.register_node("lab:mese_pack", {
	description = "Mese pack",
	tiles = {"default_mese_block.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4, -0.4, -0.1, 0.4, 0.4, 0.1},
			{-0.1, -0.4, -0.4, 0.1, 0.4, 0.4},
		}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	color = color,
	groups = {cracky = 1, snappy = 1},
	use_texture_alpha = true,
	sounds = sounds,
	light_source = 9,
	visual_scale = 0.5,
})