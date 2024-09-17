minetest.register_lbm({
	name = ":ilovetrees",
	nodenames = {"default:tree"},
	run_at_every_load = true,
	bulk_action = function(pos_list, dtime_s)
		print("bulk LBM on " .. #pos_list .. " nodes")
		core.bulk_set_node(pos_list, {name="default:cobble"})
	end,
})

local n_processed = 0
minetest.register_globalstep(function()
	if n_processed == 0 then
		return
	end
	print("regular LBM on " .. n_processed .. " nodes")
	n_processed = 0
end)

minetest.register_lbm({
	name = ":iloveapples",
	nodenames = {"default:apple"},
	run_at_every_load = true,
	action = function(pos, node, dtime_s)
		n_processed = n_processed + 1
		core.set_node(pos, {name = "default:dirt"})
	end,
})
