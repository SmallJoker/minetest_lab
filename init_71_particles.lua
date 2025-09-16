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



-- By DragonWrangler1, https://github.com/luanti-org/luanti/issues/16450#issuecomment-3238611438
-- For PR #16458
core.register_chatcommand("spam", {
	params = "",
	func = function(name, param)
		local pos = core.get_player_by_name(name):get_pos()
        pos.y = pos.y + 1.5 -- a bit above player

        for i = 1, 100 do
            core.add_particle({
                pos = {
                    x = pos.x + math.random(-10, 10) / 10,
                    y = pos.y + math.random(-10, 10) / 10,
                    z = pos.z + math.random(-10, 10) / 10,
                },
                velocity = {
                    x = math.random(-20, 20) / 10,
                    y = math.random(5, 20) / 10,
                    z = math.random(-20, 20) / 10,
                },
                acceleration = {x = 0, y = -4, z = 0},
                expirationtime = math.random(5, 15) / 10,
                size = math.random(1, 3),
                texture = "heart.png",
                glow = 5,
            })
        end
    end,
})


-- 'texpool' field
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

-- 'node' field
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

-- 'glow' field
local do_glow = false
minetest.register_chatcommand("glow", {
	func = function(name, param)
		do_glow = not do_glow
		return true, "Set to: " .. tostring(do_glow)
	end
})

local rnd = math.random
core.register_globalstep(function(dtime)
	if not do_glow then
		return
	end
	for _, player in ipairs(core.get_connected_players()) do
		core.add_particle({
			pos = vector.add(player:get_pos(),vector.new(rnd(-3,3), rnd(-3,3), rnd(-3,3))),
			velocity = vector.new(rnd(-5,5), rnd(-5,5), rnd(-5,5)),
			acceleration = vector.zero(),
			expirationtime = 1,
			size = 2,
			collisiondetection = false,
			collision_removal = false,
			vertical = false,
			texture = "bubble.png",
			glow = 14
		})
	end
end)
