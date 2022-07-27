local snowbox = {
	type = "leveled",
	fixed = {-0.5, -0.5, -0.5, 0.5, -0.5, 0.5},
}
minetest.register_node("lab:snow", {
	description = "Test Snow",
	tiles = {"default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	paramtype2 = "leveled",
	buildable_to = false,
	floodable = true,
	walkable = true,
	drawtype = "nodebox",
	leveled = 16,
	leveled_max = 127,
	node_box = snowbox,
	collision_box = snowbox,
	selection_box = snowbox,
	groups = {crumbly = 3, falling_node = 1, snowy = 1},
	node_placement_prediction = "",
	on_place = function(itemstack, placer, pt)
		local pos = pt.under
		local node = minetest.get_node(pos)
		if node.name ~= "lab:snow" then return minetest.item_place(itemstack, placer, pt) end
		minetest.add_node_level(pos, 16)
		return itemstack
	end,
})