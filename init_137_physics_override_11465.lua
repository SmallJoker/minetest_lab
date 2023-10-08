local defs = {
	fast_climb = {
		speed = 6,
		speed_climb = 5,
	},
	crouch_swim = {
		speed_crouch = 50,
		liquid_fluidity = 20,
		liquid_fluidity_smooth = 0,
	},
	inverse = {
		liquid_sink = -5,
		speed_climb = -5,
	},
	plane = {
		acceleration_default = 0.1,
		acceleration_air = 20,
	},
	default = {
		speed = 1,
		speed_climb = 1,
		speed_crouch = 1,
		liquid_fluidity = 1,
		liquid_sink = 1,
		acceleration_default = 1,
		acceleration_air = 1,
	}
}

minetest.register_chatcommand("phys", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not defs[param] then
			param = "default"
		end
		player:set_physics_override(defs[param])

		return true, "Set physics to " .. param
	end
})