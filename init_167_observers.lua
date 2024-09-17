
minetest.register_chatcommand("p", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local pos = player:get_pos()

		assert(minetest.is_valid_player_name("v5Aalid_"))
		local obj = core.spawn_item(pos, "default:dirt")
		obj:set_observers({["foo"] = true, ["bar"] = true, [name] = false })

		player:set_attach(obj)
		return true, "OK!"
	end
})
