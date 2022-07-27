
minetest.register_node(minetest.get_current_modname() .. ":grass_top", {
	description = "Grass",
	drawtype = "plantlike",
	paramtype = "light",
	--waving = 1,  -- Solves the issue
	tiles = { "default_stick.png" },
	use_texture_alpha = "blend",
	--sunlight_propagates = true, -- Does not matter
	groups = { snappy = 3 },
})

minetest.override_item("default:dirt_with_grass", {
	use_texture_alpha = "blend"
})

minetest.register_on_newplayer(function(...)
	print("newplayer", dump({...}))
end)
