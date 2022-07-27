minetest.register_chatcommand("get", {
	func = function(name, param)
		local online, player = minetest.get_player_or_load(param)
		print(online, dump(player))
		if not player then
			return false, "Player does not exist."
		end
		local meta = player:get_meta()
		print(meta:get_string("yeet"))
		meta:set_string("yeet", "true")
		player:set_hp(15)

		local inv = player:get_inventory()
		inv:add_item("main", "default:mese")

		player:close(true)
		return true, "Saved!";
	end
})