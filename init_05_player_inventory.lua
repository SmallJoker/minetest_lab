
core.register_allow_player_inventory_action(function(player, action, inv, data)
	print(("DO?  action=%s name=%s"):format(action, player:get_player_name()))
	if action == "move" and data.to_list ~= "craft" then
		-- Do not move anything but to craft
		return 0
	end
	if action == "take" and data.stack:get_name() == "default:sand" then
		-- Infinite sand in inventory
		return -1
	end
end)

core.register_on_player_inventory_action(function(player, action, inv, data)
	print(("DONE action=%s name=%s"):format(action, player:get_player_name()))
end)