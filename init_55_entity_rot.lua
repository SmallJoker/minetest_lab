
minetest.register_entity(":entity:test", {
	initial_properties = {
		visual = "mesh",
		mesh = "character.b3d",
		textures = {"character.png"},
		automatic_rotate = 0.05,
		static_save = false
	},
	on_punch = function(self)
		self.object:remove()
	end,
	on_step = function(self, dtime)
		self._time = (self._time or 0) + dtime
		if self._time >= 3 then
			self._vec = self._vec or vector.new()
			self._vec.x = self._vec.x + math.pi * 0.25
			--self._vec.y = self._vec.y + math.pi * 0.5
			self._time = 0
			self.object:set_rotation(self._vec)
		end
	end,
})

minetest.register_chatcommand("entitytest", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local pos = player:get_pos()
		pos.y = pos.y + 1

		local obj = minetest.add_entity(pos, "entity:test")
		local obj2 = minetest.add_item(pos, "default:dirt")
		minetest.after(1, function()
			obj2:set_attach(obj, "", {x = 0, y = 15, z = 8}, {x = 0, y = 0, z = 0})
		end)
	end,
})