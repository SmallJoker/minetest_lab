core.register_chatcommand("bs", {
	func = function(name, param)
		local pos = core.string_to_pos(param)
		if not pos then
			return false, "Cannot parse pos"
		end
		return true, "Status of block " .. core.pos_to_string(pos) .. ": "
			.. tostring(core.compare_block_status(pos, "loaded"))
	end,
})

minetest.register_on_generated(function(minp, maxp, blockseed)
	print("Block inside pos " .. core.pos_to_string(minp) .. ": "
		.. tostring(core.compare_block_status(minp, "emerging")))
end)