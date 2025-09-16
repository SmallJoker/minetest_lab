-- Source: https://github.com/luanti-org/luanti/pull/15919

assert(core.get_modpath("basenodes"), "Devtest needed")

if core.get_modpath("basenodes") and core.get_mapgen_setting("mg_name") == "singlenode" then
	core.register_on_joinplayer(function()
		core.chat_send_all("LBM was registered")
	end)
	core.register_lbm({
		name = ":lab:reliability_test",
		nodenames = {"basenodes:dirt_with_grass"},
		bulk_action = function(pos_list)
			print("swapping grass in " .. core.pos_to_string(vector.floor(vector.divide(pos_list[1], 16))))
			core.bulk_swap_node(pos_list, {name="basenodes:stone"})
		end,
	})
end