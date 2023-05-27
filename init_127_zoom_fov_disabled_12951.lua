minetest.register_on_joinplayer(function(player)
	player:set_properties({
		zoom_fov = 60.0, -- enables zoom
	})
end)

minetest.register_chatcommand("p", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		-- the following line can be commented out to remove the message
		player:set_fov(tonumber(param) or 0, true, 0.1)
	end
})