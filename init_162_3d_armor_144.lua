minetest.register_on_respawnplayer(function(player)
	player:set_physics_override({ speed = 2.5 })
	print("on_respawn | Speed now = " .. player:get_physics_override().speed) -- 2.5

	minetest.after(0.1, function()
		print("on_respawn | Speed 1 step after = " .. player:get_physics_override().speed) -- 1
	end)
end)
