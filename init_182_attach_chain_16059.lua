-- Source: https://github.com/luanti-org/luanti/issues/16059

core.register_chatcommand("a", {
	func = function(name)
		local p = core.get_connected_players()
		if #p < 2 then
			return false, "Not enough player"
		end
		if math.random() < 0.5 then
			-- swap
			local tmp = p[1]
			p[1] = p[2]
			p[2] = tmp
		end

		p[1]:set_attach(p[2])

		core.after(0.5, function()
			p[1]:set_detach()
			p[2]:set_attach(p[1])
		end)

		core.after(2, function()
			p[2]:set_detach()
		end)

		return true, p[1]:get_player_name() .. " (1) --> " .. p[2]:get_player_name()
	end
})
