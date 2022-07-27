core.register_chatcommand("biome_data", {
	func = function(name)
		local player = core.get_player_by_name(name)
		local dat = core.get_biome_data(player:get_pos())
		print("get_biome_data: " .. dump(dat))
		print("biome definition: " .. dump(
			core.registered_biomes[core.get_biome_name(dat.biome)]
			or core.registered_biomes[dat.biome]
		))
	end
})