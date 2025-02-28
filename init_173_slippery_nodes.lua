local function make_slippery(name, howmuch)
	assert(type(howmuch) == "number")
	local def = core.registered_nodes[name]
	def.groups.slippery = howmuch
	minetest.override_item(name, {
		groups = def.groups
	})
end


make_slippery("default:dirt_with_grass", 4)
make_slippery("default:sand", 3)

local function make_bouncy(name, howmuch)
	assert(type(howmuch) == "number")
	local def = core.registered_nodes[name]
	def.groups.bouncy = howmuch
	minetest.override_item(name, {
		groups = def.groups
	})
end

make_bouncy("default:stone", 100)

core.register_chatcommand("pushz", {
	func = function(name)
		local player = core.get_player_by_name(name)
		local yaw = player:get_look_horizontal() * 180 / math.pi
		local v = 10
		if yaw > 360 - 45 or yaw < 45 then
			player:add_velocity({x = 0, y = 0, z = v})
		elseif yaw < 180 - 45 then
			player:add_velocity({x = -v, y = 0, z = 0})
		elseif yaw < 180 + 45 then
			player:add_velocity({x = 0, y = 0, z = -v})
		else
			player:add_velocity({x = v, y = 0, z = 0})
		end

	end
})
