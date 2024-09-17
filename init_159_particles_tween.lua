-- Author: sfan5 (C) 2022
-- https://gist.github.com/sfan5/f3b8c427c5873474c947df20ff689e22

assert(minetest.features.particlespawner_tweenable)

local TEXPOOL = {
	{name = "default_apple.png"},
	{name = "farming_bread.png"},
}
local TWEEN_STYLE = 'fwd'
local TIME = 3

local function boxexp(b, n)
	local ret = {}
	if type(b[1]) == "table" then
		for _, b2 in ipairs(b) do
			table.insert(ret, boxexp(b2, n))
		end
	else
		local c = { (b[1] + b[4]) / 2 , (b[2] + b[5]) / 2 , (b[3] + b[6]) / 2 }
		for i = 1, 3 do
			ret[i] = math.max(-0.5, (b[i] - c[i]) * n + c[i])
		end
		for i = 4, 6 do
			ret[i] = math.min(0.5, (b[i] - c[i-3]) * n + c[i-3])
		end
	end
	return ret
end

local registered = {}
local function register(name, def)
	def.range = def.range or 0
	registered[name] = def
	local modname = minetest.get_current_modname()

	minetest.register_node(modname .. ":" .. name, {
		description = def.desc,
		drawtype = "nodebox",
		tiles = {"default_cloud.png^[colorize:" .. def.color},
		node_box = {
			type = "fixed",
			fixed = def.box,
		},
		selection_box = {
			type = "fixed",
			fixed = boxexp(def.box, 4),
		},
		paramtype = "light",
		walkable = false,
		is_ground_content = false,
		groups = {cracky = 1},
		on_construct = function(pos)
			minetest.get_meta(pos):set_string("infotext", def.desc)
		end,
	})
	minetest.register_abm({
		label = "spawing: " .. name,
		nodenames = {modname .. ":" .. name},
		neighbors = {"air"},
		interval = TIME, chance = 1,
		action = function(pos, node)
			local spawner = {
				amount = 32,
				time = TIME,
				size = 1.5,
				pos = {
					min = vector.subtract(pos, def.range),
					max = vector.add(pos, def.range),
				},
				vel = 0,
				texpool = TEXPOOL,
			}
			local p = type(def.spawner) == "function" and def.spawner(pos) or def.spawner
			if p.texture then spawner.texpool = nil end
			for k, v in pairs(p) do
				spawner[k] = v
			end
			local x = minetest.add_particlespawner(spawner)
			--print(dump(spawner))
			assert(type(x) == "number")
		end
	})
end

----

register("attp", {
	desc = "Particle Attract (Point)",
	color = "#111111",
	box = {-0.05, -0.05, -0.05, 0.05, 0.05, 0.05},
	range = 1,
	spawner = function(pos)
		return {
			attract = {
				kind = "point",
				origin = pos,
				strength = 1,
			},
		}
	end,
})

register("attl", {
	desc = "Particle Attract (Line)",
	color = "#111111",
	box = {-0.05, -0.5, -0.05, 0.05, 0.5, 0.05},
	range = 1,
	spawner = function(pos)
		return {
			attract = {
				kind = "line",
				origin = pos,
				angle = vector.new(0,1,0),
				strength = 1,
			},
		}
	end,
})

register("atte", {
	desc = "Particle Attract (Plane)",
	color = "#111111",
	box = {-0.5, -0.05, -0.5, 0.5, 0.05, 0.5},
	range = 1,
	spawner = function(pos)
		return {
			attract = {
				kind = "plane",
				origin = pos,
				angle = vector.new(0,1,0),
				strength = 1,
			},
		}
	end,
})

--

register("sph", {
	desc = "Particle Sphere",
	color = "#111111",
	box = {
		{-0.1,  -0.05, -0.05, 0.1,  0.05, 0.05},
		{-0.05, -0.1,  -0.05, 0.05, 0.1,  0.05},
		{-0.05, -0.05, -0.1,  0.05, 0.05, 0.1},
	},
	spawner = function(pos)
		return {
			radius = 1,
		}
	end,
})

register("sph_b", {
	desc = "Particle Sphere (Bias)",
	color = "#ee1111",
	box = registered["sph"].box,
	spawner = function(pos)
		return {
			radius = {min = 0, max = 1, bias = -9999},
		}
	end,
})

register("sph_t", {
	desc = "Particle Sphere (Tween)",
	color = "#11ee11",
	box = registered["sph"].box,
	spawner = function(pos)
		return {
			radius_tween = {
				style = TWEEN_STYLE,
				1, 0,
			},
		}
	end,
})

--

register("drag", {
	desc = "Particle Drag (+)",
	color = "#111111",
	box = {
		{-0.5, -0.05, -0.05, 0.3, 0.05, 0.05},
		{ 0.4, -0.05, -0.05, 0.5, 0.05, 0.05}
	},
	range = 0.5,
	spawner = function(pos)
		return {
			vel = vector.new(1,0,0),
			drag = vector.new(1,0,0),
		}
	end,
})

register("drag2", {
	desc = "Particle Drag (-)",
	color = "#111111",
	box = registered["drag"].box,
	range = 0.5,
	spawner = function(pos)
		return {
			vel = vector.new(1,0,0),
			drag = vector.new(-1,0,0),
		}
	end,
})

--

register("bounce", {
	desc = "Particle Bounce",
	color = "#111111",
	box = {
		{-0.05, -0.5, -0.05, 0.05, -0.4, 0.05},
		{-0.05, -0.3, -0.04, 0.04,  0.5, 0.05}
	},
	range = 0.5,
	spawner = function(pos)
		return {
			acc = vector.new(0,-9.81,0),
			bounce = 0.5,
			collisiondetection = true,
		}
	end,
})

register("bounce_b", {
	desc = "Particle Bounce (Bias)",
	color = "#ee1111",
	box = registered["bounce"].box,
	range = 0.5,
	spawner = function(pos)
		return {
			acc = vector.new(0,-9.81,0),
			bounce = {min = 0, max = 1, bias = -9999},
			collisiondetection = true,
		}
	end,
})


register("bounce_t", {
	desc = "Particle Bounce (Tween)",
	color = "#11ee11",
	box = registered["bounce"].box,
	range = 0.5,
	spawner = function(pos)
		return {
			acc = vector.new(0,-9.81,0),
			bounce_tween = {
				style = TWEEN_STYLE,
				1, 0,
			},
			collisiondetection = true,
		}
	end,
})

--

register("alt", {
	desc = "Particle Alpha (Tween)",
	color = "#11ee11",
	box = {-0.05, -0.1, -0.05, 0.05, 0.1, 0.05},
	range = 0.5,
	spawner = function(pos)
		return {
			texture = {
				name = "default_grass_3.png",
				alpha_tween = {
					1, 0, style = TWEEN_STYLE,
				},
			},
		}
	end,
})

--

register("scalet", {
	desc = "Particle Scale (Tween)",
	color = "#11ee11",
	box = {-0.1, -0.05, -0.05, 0.1, 0.05, 0.05},
	range = 0.5,
	spawner = function(pos)
		return {
			texture = {
				name = "default_grass_3.png",
				scale_tween = {
					style = TWEEN_STYLE,
					0.5, 1.5,
				},
			},
		}
	end,
})