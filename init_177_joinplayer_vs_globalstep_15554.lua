local seen = {}

core.register_on_joinplayer(function(player)
	seen[player:get_player_name()] = true
end)

core.register_on_leaveplayer(function(player)
	seen[player:get_player_name()] = true
end)

core.register_globalstep(function(dtime)
	for _, player in ipairs(core.get_connected_players()) do
		local name = player:get_player_name()
		if not seen[name] then
			error("PLAYER SHOULD NOT BE LISTED: " .. name)
		end
	end
	print(".")
end)
