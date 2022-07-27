local modpath = minetest.get_modpath("mcl_structures")
--modpath = minetest.get_modpath(minetest.get_current_modname())

minetest.register_chatcommand("s", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local pos = vector.round(player:get_pos())

		local schematic = modpath.."/schematics/mcl_structures_ice_spike_small.mts"

		print("serialize called")
		local s = loadstring(minetest.serialize_schematic(schematic, "lua", {
			lua_use_comments = false,
			lua_num_indent_spaces = 0
		}) .. " return(schematic)")()

		minetest.place_schematic(pos, schematic, nil, {}, true, {})
		--print(dump(s))
	end
})
