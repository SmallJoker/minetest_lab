map.update_hud_flags = function() end

minetest.register_chatcommand("minimap", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		player:hud_set_flags({minimap = false})
		player:set_minimap_modes({
			{ type = "surface", label = "surface mode", size = 700 },
			{ type = "surface", size = 400 },
			{ type = "radar", size = 258 },
			{ type = "off" }
		}, 0)

		player:hud_add({
			hud_elem_type = "minimap",
			position = { x= 0.5, y=0.5 },
			offset = { x=10, y=0 },
			size = { x= 100, y= 300 },
			alignment = { x= 1, y = 1},
		})
	end
})