
minetest.register_on_mods_loaded(function()
for name, def in pairs(core.registered_nodes) do
	local can_replace = false
	if def.drawtype == "normal"
			and type(def.tiles) == "table" then
		can_replace = true
	end
	if can_replace then
		for i, tile in pairs(def.tiles) do
			if type(tile) ~= "string" then
				can_replace = false
				break
			end
		end
	end
	if can_replace then
		if #def.tiles == 1 or name == "bones:bones" then
			core.override_item(name, {
				-- Top, left, right
				inventory_image = core.inventorycube(def.tiles[1], def.tiles[1], def.tiles[1])
			})
		elseif #def.tiles == 3 then
			core.override_item(name, {
				-- Top, left, right
				inventory_image = core.inventorycube(def.tiles[1], def.tiles[3], def.tiles[3])
			})
		elseif #def.tiles == 6 then
			core.override_item(name, {
				-- Top, left, right
				inventory_image = core.inventorycube(def.tiles[1], def.tiles[6], def.tiles[3])
			})
		end
	end
end
end)

