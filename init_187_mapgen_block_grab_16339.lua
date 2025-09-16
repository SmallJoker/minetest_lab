local luafile = core.get_worldpath() .. "/tmptest.lua"
do
	local f = io.open(luafile, "wb")
	f:write([[
		core.register_on_generated(function()
			core.ipc_poll("", 100000)
		end)
	]])
	f:close()
end
core.register_mapgen_script(luafile)

core.register_on_shutdown(function()
	os.remove(luafile)
end)
