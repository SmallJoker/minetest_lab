do
	local theta = 0
	local function fx()
		minetest.after(0.25, fx)

		-- singleplayer only
		local players = minetest.get_connected_players()
		local player = players[next(players)]
		if not player then return end

		local pos = player:get_pos()
		pos.y = pos.y + player:get_properties().eye_height
		local look = player:get_look_dir()
		local vert = vector.new(0, 1, 0)
		local horz = vector.cross(look, vert)
		vert = vector.cross(look, horz)
		theta = theta + math.pi / 8
		local targ = vector.add(pos, vector.multiply(look, 5))
		targ = vector.add(targ, vector.multiply(horz, math.sin(theta) * 3))
		targ = vector.add(targ, vector.multiply(vert, math.cos(theta) * 3))

		print(minetest.add_particlespawner({
				time = 1,
				amount = 50,
				minexptime = 0.5,
				maxexptime = 0.5,
				minpos = vector.offset(targ, -0.5, -0.5, -0.5),
				maxpos = vector.offset(targ, 0.5, 0.5, 0.5),
				minsize = 1,
				maxsize = 1,
				texture = "[combine:1x1^[noalpha",
			}), "black")
	end
	minetest.after(0, fx)
end


do
	local oldid
	local function fx()
		minetest.after(0.1, fx)

		-- singleplayer only
		local players = minetest.get_connected_players()
		local player = players[next(players)]
		if not player then return end

		local pos = player:get_pos()
		pos.y = pos.y + player:get_properties().eye_height
		pos = vector.offset(pos, math.random() * 10 - 5, math.random() * 10 - 5,
			math.random() * 10 - 5)
		if oldid then minetest.delete_particlespawner(oldid) end
		oldid = minetest.add_particlespawner({
				time = 1,
				amount = 50,
				minexptime = 0.5,
				maxexptime = 0.5,
				minpos = vector.offset(pos, -0.5, -0.5, -0.5),
				maxpos = vector.offset(pos, 0.5, 0.5, 0.5),
				minsize = 1,
				maxsize = 1,
				texture = "[combine:1x1^[noalpha^[invert:rgb",
			})
		print(oldid, "white")
	end
	minetest.after(0, fx)
end
