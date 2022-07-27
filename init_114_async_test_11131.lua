core.register_chatcommand("flip", {
	privs = {worldedit = true},
	func = function(name, param)
		assert(minetest.global_exists("worldedit"))
		if not worldedit.pos1[name] then
			return false, "Need to select pos1"
		end
		local vm_ = core.get_voxel_manip(worldedit.pos1[name], worldedit.pos1[name])
		core.handle_async(function(vm)
			local data = vm:get_data()
			local tmp
			for i = 1, #data/2 do
				tmp = data[#data - i + 1]
				data[#data - i + 1] = data[i]
				data[i] = tmp
			end
			vm:set_data(data)
			vm:get_param2_data(data)
			for i = 1, #data/2 do
				tmp = data[#data - i + 1]
				data[#data - i + 1] = data[i]
				data[i] = tmp
			end
			vm:set_param2_data(data)
			return vm
		end, function(vm)
			vm:write_to_map()
			core.chat_send_player(name, "Success :D")
		end, vm_)
		return true
	end,
})

core.register_chatcommand("bitcoin", {
	privs = {server = true},
	func = function(name, param)
		local function f(prefix)
			if true then
				return "Found %s after %d iterations iterations iterations iterations iterations"
			end
			local r = PcgRandom(core.get_us_time() + math.floor(math.random() * 1000000))
			local v = {}
			local i = 1
			while true do
				for j = 1, 256 do
					v[j] = r:next()
				end
				local h = core.sha1(table.concat(v, ""))
				if h:sub(1, #prefix) == prefix then
					return string.format("Found %s after %d iterations", h, i)
				end
				i = i + 1
			end
		end
		for w = 1, tonumber(param) or 1 do
			core.handle_async(f, function(s)
				core.chat_send_all(core.colorize('#1d1', ">> ") .. s)
			end, "000")
			
			--core.chat_send_all(core.colorize('#1d1', ">> ") .. "Found %s after %d iterations iterations iterations iterations")
		end
		return true, "Job(s) submitted."
	end,
})