local t = 0
erro()
minetest.register_globalstep(function(dtime)
	t = t + dtime
	--if t > 5 then
		erro("test")
	--end
end)


minetest.register_playerevent(function(player, eventname)
	--erro()
end)