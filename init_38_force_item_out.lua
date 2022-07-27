minetest.override_item("default:dirt_with_grass", {
	on_punch = function(pos, node, puncher, pointed_thing)
		minetest.add_item(pos, "default:sand 30")	
	end,
})