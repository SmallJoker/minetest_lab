minetest.register_chatcommand("entities", {
	func = function(pname)
		local pos = minetest.get_player_by_name(pname):get_pos()
		for name, def in pairs(minetest.registered_entities) do
			assert(minetest.add_entity(vector.add(pos, {
					x = math.random() * 6,
					y = math.random() * 6 + 8,
					z = math.random() * 6,
				}), name))
			print("Spawned " .. name)
		end
	end
})


if true then return end
-- Error tests

minetest.register_node(":errornode", {
	description = {},
	visual_scale = { x = 10, y = -1 },
	use_texture_alpha = "yes"
})

-- /spawnentity errorentity
minetest.register_entity(":errorentity", {
	initial_properties = {
		hp_max = function() end,
		is_visible = {},
		mesh = math.huge
	}
})