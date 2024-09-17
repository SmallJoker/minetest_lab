assert(default.register_fence, "Needs MTG")

local my_node_box = {
	type = "fixed",
	fixed = {-1/4, -1/2, -1/3, 1/4, -1/4, 1/3},
}

default.register_fence("lab:facedir_wallmounted", {
	description = "FACEDIR WALLMOUNTED",
	texture = "default_fence_wood.png",
	material = "default:stick",
	paramtype2 = "facedir",
	node_box = my_node_box,
	collision_box = my_node_box,
	groups = {choppy = 1, oddly_breakable_by_hand = 1},
	on_place = minetest.rotate_node
})
