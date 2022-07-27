local t = 0
local who = "?"

minetest.register_globalstep(function(dtime)
	t = t + dtime
	if t < 1 then
		return
	end
	t = t - 1

	local player = minetest.get_player_by_name(who)
	if player then
		print(who .. " -> " .. dump(player:get_player_control()))
	end
end)

minetest.register_on_joinplayer(function(player)
	who = player:get_player_name()
end)
