local V = vector.new
local PP = minetest.pos_to_string

local views = {
	reset = {},
	[""] = {},

	-- (P1 view) up deplacement
	y_z = { V(0, 10, 0), V(0, 15, 0), V() },
	y_p = { V(0, 10, 0), V(0, 15, 0), V(0, 10, 0) },
	y_n = { V(0, -5, 0), V(0, -10, 0), V(0, -10, 0) },

	-- (P1 view) right deplacement
	x_z = { V(5, 0, 0), V(10, 0, 0), V() },
	x_p = { V(5, 0, 0), V(10, 0, 0), V(10, 0, 0) },
	x_n = { V(-5, 0, 0), V(-10, 0, 0), V(-10, 0, 0) },

	-- (P1 view) forward deplacement
	z_z = { V(0, 0, 5), V(0, 0, 5), V() },
	z_p = { V(0, 0, 5), V(0, 0, 5), V(0, 0, 5) },
	z_n = { V(0, 0, -5), V(0, 0, -5), V(0, 0, -5) },
}

minetest.register_chatcommand("view", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local vals = views[param]
		if not vals then
			return false, "Unknown view type"
		end
		player:set_eye_offset(vals[1], vals[2], vals[3])
		local v1, v3b, v3f = player:get_eye_offset()
		print(PP(v1), PP(v3b), PP(v3f))
    end
})