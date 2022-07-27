minetest.register_on_joinplayer(function(player)
	player:set_properties({
		textures = {"player.png", "player_back.png"},
		visual = "upright_sprite",
		visual_size = {x = 1, y = 2},
		collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.0, 0.3},
        colors = { "#F00", "#AAA" },
		glow = 4
	})
end)
