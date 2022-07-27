-- 4.0f in Game::processPlayerInteraction
local hand_range = core.registered_items[""].range or 4

local function get_pointed_thing(player)
	local eye_y = player:get_properties().eye_height
	local offset_1st, offset_3rd = player:get_eye_offset()

	local pos1 = vector.add(player:get_pos(), offset_1st)
	pos1.y = pos1.y + eye_y

	-- Get actual tool range
	local wield_item = player:get_wielded_item()
	local tool_range = hand_range
	if wield_item:is_known() then
		tool_range = wield_item:get_definition().range or hand_range
	end

	-- Shoot into the look direction
	local look_dir = player:get_look_dir()
	local pos2 = vector.add(pos1, vector.multiply(look_dir, tool_range))

	local raycast = core.raycast(pos1, pos2, true, false)
	local pointed = raycast:next()
	if pointed and pointed.type == "object"
			and pointed.ref == player then
		pointed = raycast:next()
	end
	return pointed
end

local time = 0
core.register_globalstep(function(dtime)
	time = time + dtime
	if time < 1.5 then
		return
	end
	time = time - 1.5

	for i, player in pairs(core.get_connected_players()) do
		local pointed_thing = get_pointed_thing(player)
		local pointed_node = nil
		if pointed_thing and pointed_thing.type == "node" then
			pointed_node = core.get_node(pointed_thing.under)
		end
		core.chat_send_player(
			player:get_player_name(),
			dump(pointed_node)
		)
	end
end)
