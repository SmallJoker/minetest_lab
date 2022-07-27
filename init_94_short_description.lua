core.register_chatcommand("desc", {
	func = function(name, param)
		local player = core.get_player_by_name(name)
		print(player:get_wielded_item():to_string())
		print("\t^" .. player:get_wielded_item():get_short_description() .. "$")
		print("\t^" .. player:get_wielded_item():get_description() .. "$")
		local function u8iter(s, f)
			local i, i2 = 1, 1
			while i <= #s do
				local c = s:sub(i,i); i = i + 1
				while (s:byte(i) or 0) >= 128 and s:byte(i) < 192 do
					c = c .. s:sub(i,i); i = i + 1
				end
				f(i2, c); i2 = i2 + 1
			end
		end

		local colors = {"#f55", "#5f5", "#55f"}
		local s = "foo_bar a我b都c我d都e我f都g我h都i我0都9我_都-我 我都我 foo_bar"
		local r = ""
		u8iter(s, function(n, char)
			r = r .. core.colorize(colors[(n-1) % #colors + 1], char)
		end)
		return true, r
	end,
})
