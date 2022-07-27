
local death_pos = nil
minetest.register_on_dieplayer(function(player)
	death_pos = player:get_pos()
end)

minetest.register_on_respawnplayer(function(player)
	local objects = minetest.get_objects_inside_radius(death_pos, 2)
	for _, obj in ipairs(objects) do
		if obj:get_luaentity() and
				obj:get_luaentity().name == "lab:cube" then
			player:set_attach(obj, "", {x = 0, y = 0, z = 0}, {x = 0, y = 0, z = 0})
			return
		end
	end
	local obj = minetest.add_item(death_pos, "default:dirt")
	player:set_attach(obj, "", {x = 0, y = 0, z = 0}, {x = 0, y = 0, z = 0})
end)