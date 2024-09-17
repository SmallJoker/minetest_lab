local function vector_rand(vec, ampl)
	return vector.apply(vec, function(n)
		return n + math.random() * ampl
	end)
end

minetest.register_chatcommand("particle", {
	params = "",
	func = function(name, param)
		local pos = minetest.get_player_by_name(name):get_pos()
		pos.y = pos.y + 1
		minetest.add_particle({
			pos = vector_rand(pos, 0.5),
        	velocity = vector_rand({x=0, y=0.2, z=0}, 0.1),
        	expirationtime = 3,
			size = 4,
			texture = "bubble.png"
		})
		return true
	end,
})
minetest.register_chatcommand("particles", {
	params = "<n count>",
	func = function(name, param)
		local pos = minetest.get_player_by_name(name):get_pos()
		pos.y = pos.y + 1
		minetest.add_particlespawner({
			amount = tonumber(param) or 10,
			time = 8,
			minpos = vector_rand(pos, 5),
			maxpos = vector_rand(pos, 5),
			minvel = vector_rand({x=0, y=0.2, z=0}, 0.1),
			maxvel = vector_rand({x=0, y=0.2, z=0}, 0.1),
			--texture = { name = "heart.png", blend = "alpha"},
			texpool = {
				{ name = "heart.png", blend = "alpha", scale = 2 },
			},
			minsize = 3,
			maxsize = 4,
			glow = 2
		})
		return true
	end,
})

core.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	pos.y = pos.y + 0.55
	local g = vector.new(0, -9.81, 0)
	core.add_particlespawner({
		minpos = pos, maxpos = pos,
		minvel = vector.new(-1, 2.5, -1),
		maxvel = vector.new(1, 5, 1),
		minacc = g, maxacc = g,
		minsize = 1, maxsize = 6,
		time = 3.2,
		amount = 400,
		node = node,
		node_tile = 6,
	})
end)