
minetest.register_chatcommand("immortal", {
	description = "Sets your damage",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Mods may not call this command."
		end
		local val = minetest.is_yes(param) and 1 or nil
		local groups = player:get_armor_groups()
		groups.immortal = val
		player:set_armor_groups(groups)
		return true, "Set to " .. tostring(val)
	end
})