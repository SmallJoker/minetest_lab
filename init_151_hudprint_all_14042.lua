local modpath = minetest.get_modpath(minetest.get_current_modname())
dofile(modpath .. "/init_68_compass_hud.lua")
dofile(modpath .. "/init_106_dynamic_media2.lua")

-- From games/devtest/mods/testhud/init.lua

minetest.register_chatcommand("hudprint", {
	description = "Writes all used Lua HUD elements into chat.",
	func = function(name, params)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "No player."
		end

		local s = "HUD elements:"
		for k, elem in pairs(player:hud_get_all()) do
			local ename = dump(elem.name)
			local etype = dump(elem.type)
			local epos = "{x="..elem.position.x..", y="..elem.position.y.."}"
			s = s.."\n["..k.."]  type = "..etype.." | name = "..ename.." | pos = ".. epos
		end

		return true, s
	end
})
