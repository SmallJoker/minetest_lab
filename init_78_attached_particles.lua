--  /spawnentity lab:test

minetest.register_entity("lab:test", {
	initial_properties = {
		hp = 1,
		visual = "cube",
		visual_size = {x = 1, y = 1},
		textures = { "default_stone.png" },
		static_save = false,
		is_visible = false,
	},
	_step = 0,
	on_step = function(self, dtime)
		if self._step < 0 then return end
		self._step = self._step + dtime
		if self._step < 2 then return end
		self._step = -1

		minetest.add_particlespawner({
			attached = self.object,
			amount = 10,
			texture = "default_dirt.png",
			collisiondetection = false,
			time = 3
		})
		print("Spawned particles")
	end
})
