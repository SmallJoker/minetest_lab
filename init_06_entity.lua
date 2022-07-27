minetest.register_node(":labnode", {
	description = "bruh",
	tiles = {"default_apple.png",},
	groups = {cracky = 2},
	is_ground_content = false,
	on_punch = function(pos, node, puncher, pointed_thing)
		local flags = puncher:hud_get_flags()
		-- Swap each punch
		flags.healthbar = not flags.healthbar
		puncher:hud_set_flags(flags)
	end,
})


minetest.register_chatcommand("g", {
func = function(name, param)
	local player = minetest.get_player_by_name(name)
	local pos = vector.round(player:get_pos())

	for _, obj in ipairs(core.get_objects_inside_radius(pos, 2.5)) do
		local number = -1
		for i,v in pairs(core.object_refs) do
			if v == obj then
				number = i
				break
			end
		end
		local entity = obj:get_luaentity()
		print("entity #" .. number .. " is " .. (entity and "known" or "gone") ..
			" ;; " .. (entity and entity.name or "??"))
	end
end
})

minetest.register_entity("lab:e_arrow", {
	initial_properties = {
		visual = "wielditem",
		visual_size = {x = 0.667, y = 0.667},
		textures = {"default:axe_wood"},
		physical = true,
		is_visible = true,
		collide_with_objects = false,
		collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},

	timey = 0,

	on_activate = function(self)
		print("activated!")
		--self.object:set_pos(self.object:get_pos())
	end,

	on_step = function(self, dtime)
		self.timey = self.timey + dtime
		if self.timey < 3 then
			return
		end
		self.timey = self.timey - 3
		print("pong")
	end,
})