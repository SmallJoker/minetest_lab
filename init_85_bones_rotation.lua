-- https://github.com/minetest/minetest/issues/10404
minetest.register_globalstep(function()
	for _, player in pairs(minetest.get_connected_players()) do
		player:set_bone_position("Body", {x = 0, y = 6.5, z = 0}, {x = 0, y = 180, z = 0})
	end
end)
