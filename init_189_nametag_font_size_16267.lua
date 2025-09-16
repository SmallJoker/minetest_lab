-- For https://github.com/luanti-org/luanti/pull/16267
core.register_on_joinplayer(function(player)
	local props = player:get_properties()
	print("Join", player:get_player_name(), props.nametag_fontsize, props.nametag_scale_z)
	props.nametag_fontsize = 32
	props.nametag_scale_z = true
	player:set_properties(props)
end)
