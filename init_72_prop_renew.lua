local function x()
	local player = core.get_player_by_name("singleplayer")
	player:set_properties(player:get_properties())
	core.after(2, x)
end
core.after(2, x)