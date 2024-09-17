local INIT_NUM = "172"

-- ############################################################## --

lab = {}
lab.ie = core.request_insecure_environment()
lab.http = core.request_http_api()

local modpath = minetest.get_modpath(minetest.get_current_modname())
local files = minetest.get_dir_list(modpath, false)

for i, file in ipairs(files) do
	if file:find("^init_" .. INIT_NUM .. "_[^.]*.lua$") then
		print("[lab] Loading script N°" .. INIT_NUM)
		dofile(modpath .. "/" .. file)
		lab.ie = nil
		lab.http = nil
		return
	end
end

error("\n[lab] Cannot find any file for number " .. INIT_NUM)

