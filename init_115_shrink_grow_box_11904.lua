local function modify(pointed, factor)
	print(dump(pointed))
	if pointed.type ~= "object" then
		return
	end
	--minetest.after(2, function()
		local box = pointed.ref:get_properties().selectionbox
		for k, v in ipairs(box) do
			box[k] = v * factor
		end
		pointed.ref:set_properties({
			selectionbox = box
		})
	--end)
end

minetest.register_tool(":lab:shrink_grow", {
	description = "Shrin/Grow",
	inventory_image = "default_stick.png",

	on_secondary_use = function(itemstack, placer, pointed_thing)
		return modify(pointed_thing, 2.0)
	end,
	on_use = function(itemstack, user, pointed_thing)
		return modify(pointed_thing, 0.5)
	end,
})

