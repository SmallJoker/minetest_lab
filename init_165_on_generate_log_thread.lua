minetest.register_on_generated(function(vm, minp, maxp, blockseed)
	print("mapgen thread: minp=" .. core.pos_to_string(minp) .. ": " .. blockseed)
end)
