-- For PR #14871
minetest.register_mapgen_script(minetest.get_modpath("lab") .. "/init_165_on_generate_log_thread.lua")

minetest.register_on_generated(function(minp, maxp, blockseed)
	print("main   thread: minp=" .. core.pos_to_string(minp) .. ": " .. blockseed)
end)
