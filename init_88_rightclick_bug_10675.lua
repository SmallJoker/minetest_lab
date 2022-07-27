minetest.register_node("lab:testnode", {
	description = "testnode",
	tiles = {"air.png"},
	groups = {oddly_breakable_by_hand = 3, snappy = 1},
	on_secondary_use = function(_, user, _)
		local name = user:get_player_name()
		local pos = user:get_pos()
		pos.y = pos.y + 1.5

		local obj = minetest.add_entity(
			vector.add(pos, vector.multiply(user:get_look_dir(), 2.5)),
			"lab:entity"
		)
	end,
})

minetest.register_entity("lab:entity", {
	initial_properties = {
		physical = true,
		collide_with_objects = false,
		selectionbox = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		pointable = true,
		visual = "cube",
		visual_size = {x = 0.5, y = 0.5, z = 0.5},
		textures = {},
		is_visible = true,
		automatic_rotate = 2,
		glow = 4,
		static_save = false,
	},
	on_punch = function(self, puncher, _, _, dir)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		minetest.chat_send_all("REMOVING" .. os.clock())
		self.object:remove()
	end,
})
