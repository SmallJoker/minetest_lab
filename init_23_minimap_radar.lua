core.register_on_joinplayer(function(player)
	player:hud_set_flags({
		minimap = true,
		minimap_radar = false,
		wielditem = false
	})
end)