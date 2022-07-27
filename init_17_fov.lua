local time = 0
local fov = 30
minetest.register_globalstep(function(dtime)
	time = time + dtime
	if time < 2 then
		return
	end
	time = time - 2
	if fov == 0 then
		fov = 30
	elseif fov > 100 then
		fov = 0
	else
		fov = fov + 15
	end

	for i, player in ipairs(minetest.get_connected_players()) do
		player:set_fov(fov)
	end
end)