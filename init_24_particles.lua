local old_punch = core.registered_nodes["default:stone"].on_punch

core.override_item("default:stone", {
	on_punch = function(pos, node, puncher, pointed_thing)
		minetest.add_particlespawner({
			amount = 20,
			time = 10,
			minpos = vector.add(pos, -0.5),
			maxpos = vector.add(pos, 0.5),
			minvel = vector.new(0, 1, 0),
			maxvel = vector.new(0, 2, 0),
			texture = "default_dirt.png",
			glow = 10
		})
		print("punch")
		old_punch(pos, node, puncher, pointed_thing)
	end
})
