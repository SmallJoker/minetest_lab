local function drop(pos, itemname)
	local stack = ItemStack(itemname)
	local def = stack:get_definition()

	-- Limit the maximal drop amount
	local stack_max = def and def.stack_max or 10
	-- Make high amounts unlikely to happen
	stack:set_count(math.ceil(math.random(stack_max) / math.random(stack_max)))

	minetest.item_drop(stack, nil, {
		x = pos.x + math.random(-9, 9) / 20,
		y = pos.y + math.random(-9, 9) / 20 + 1,
		z = pos.z + math.random(-9, 9) / 20
	})
end

local items_max = 0

-- Count registered items
minetest.after(0, function()
	for k, v in pairs(minetest.registered_items) do
		items_max = items_max + 1
	end
end)

minetest.register_node("lab:drop_random", {
	tiles = { "air.png" },
	on_rightclick = function(pos, node)
		-- Amount of different items to drop
		local amount = math.random(1, 3)
		for i = 1, amount do
			local number = math.random(1, items_max)
			-- Get number-th item from the table
			for name, v in pairs(minetest.registered_items) do
				number = number - 1
				if number <= 0 then
					drop(pos, name)
					break
				end
			end
		end
	end
})