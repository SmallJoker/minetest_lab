local t = 0
minetest.register_globalstep(function(dtime)
	t = t + dtime
	if t < 1 then
		return
	end
	t = t - 1

	for i, obj in ipairs(minetest.get_connected_players()) do
		print(minetest.pos_to_string(obj:get_pos()))
	end
end)