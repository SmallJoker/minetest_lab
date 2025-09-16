local function show_to(name, param)
	local basename = table.remove(string.split(param, "/"))
	local e = table.remove(string.split(basename, "."))
	basename = basename:gsub("%." .. e .. "$", "")

	if e == "ogg" then
		core.sound_play({name = basename}, {to_player = name})
	elseif e == "jpg" or e == "png" then
		core.get_player_by_name(name):hud_add({
			hud_elem_type = "image",
			position = {x = math.random(0.2, 0.8), y = math.random(0.2, 0.8)},
			scale = {x = 1, y = 1},
			text = basename .. "." .. e
		})
	end
end
core.register_chatcommand("show", {
	func = function(name, param)
		if param:sub(1, 1) ~= "/" then
			param = core.get_worldpath() .. "/" .. param
		end
		local cb = function(name2)
			print("callback(" .. name2 .. ")")
			if name == name2 then show_to(name, param) end
		end
		if not core.dynamic_add_media({
			filepath = param,
			to_player = name,
			--ephemeral = true,
		}, cb) then
			return false, "couldn't add media"
		end
		return true
	end
})

-- https://github.com/luanti-org/luanti/pull/16445
core.register_chatcommand("banana", {
	func = function(name, param)
		local s = "i am a banana"
		local ret = core.dynamic_add_media({
			filename = "dummy.obj",
			filedata = s,
			client_cache = false,
			to_player = name
		}, function() end)
		print("ret=" .. tostring(ret))
		print("sha1=" .. core.sha1(s))
	end
})