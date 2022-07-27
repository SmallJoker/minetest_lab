minetest.register_on_joinplayer(function(player)
	player:hud_add({
		hud_elem_type = "compass",
		position = { x = 0.2, y = 0.2 },
		offset = { x = 10, y = 10 },
		size = { x = 10, y = 10 },
		alignment = { x = 1, y = 1 },
		text = "gui_furnace_arrow_bg.png",
		dir = 1,
	})

	player:hud_add({
		hud_elem_type = "compass",
		position = { x = 0.6, y = 0.6 },
		offset = { x = 10, y = 170 },
		size = { x = 50, y = 50 },
		scale = { x = 1, y = 1 }, -- Required or scale would be 0
		alignment = { x= -1, y = -1 },
		text = "default_ladder_steel.png^[transformR90",
		dir = 3,
	})
end)