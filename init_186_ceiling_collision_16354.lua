-- by nauta-turbidus, https://github.com/luanti-org/luanti/issues/16354

-- See also setting "movement_gravity"

local add_vel_active = true
core.register_globalstep(function()
	if not add_vel_active then
		return
	end

	for _, obj in ipairs(core.get_connected_players()) do
		local vel = obj:get_velocity()

		if vel and vel.y < 1 then
			obj:add_velocity(vector.new(0, 1, 0))
		end
	end
end)

core.register_chatcommand("g", {
	func = function(name)
		local player = core.get_player_by_name(name)
		local acc = player:get_acceleration()
		acc.y = -acc.y
		player:set_acceleration(acc)

		add_vel_active = acc.y < 0
		return true, "Set to " .. acc.y
	end,
})

core.register_entity("lab:item", {
	initial_properties = {
		static_save = false,
		hp_max = 1,
		visual = "cube",
		node = {name = "ignore", param1=0, param2=0},
		collisionbox = {-0.4, -0.4, -0.4, 0.4, 0.4, 0.4},
		physical = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_acceleration(vector.new(0, -1, 0))
	end,
	on_step = function(self, _, _)
		local vel = self.object:get_velocity()
		if vel.y < 1 then
			self.object:set_velocity(vector.new(0, 1, 0))
		end
		self.object:set_acceleration(vector.new(0, -1, 0))
	end,
})
