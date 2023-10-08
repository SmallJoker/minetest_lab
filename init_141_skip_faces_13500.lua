minetest.register_on_joinplayer(function(player)
	player:set_sky({body_orbit_tilt = -30})
end)
