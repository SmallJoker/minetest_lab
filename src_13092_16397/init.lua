-- Written by sfan5 https://gist.github.com/sfan5/1a124eb496a39734f53fb4daffc47bee

local DEMO_GENNOTIFY = false

assert(core.register_mapgen_script)

core.register_mapgen_script(core.get_modpath(core.get_current_modname()) .. "/src_13092_16397/inner.lua")

assert(core.get_mapgen_setting("mg_name") == "singlenode") -- NEW LINE

core.set_mapgen_setting("mg_name", "singlenode", true)

core.register_on_respawnplayer(function(player)
	player:set_pos(vector.new(0, 1.5, 0))
	return true
end)

core.register_on_newplayer(function(player)
	player:set_pos(vector.new(0, 1.5, 0))
end)

-- Demonstrates the use of user-defined gennotify
if DEMO_GENNOTIFY then
	core.set_gen_notify({custom=true}, nil, {"flatgen:place_light"})
	core.register_on_generated(function(minp, maxp, blockseed)
		print("outer " .. core.pos_to_string(minp) .. " -> " .. core.pos_to_string(maxp))
		print("blockseed: " .. blockseed)

		local g = core.get_mapgen_object("gennotify")
		--print(dump(g))

		local array = g.custom["flatgen:place_light"] or {}
		for _, pos in ipairs(array) do
			core.place_node(pos, {name="default:torch", param2=1})
		end
	end)
end
