local my_huds = {}

-- Some action that needs to happen to start the countdown
minetest.register_chatcommand("countdown", {
	description = "Counts down.",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Mods may not call this command."
		end
		if my_huds[name] then
			return false, "You've already got a countdown."
		end

		-- New table for this HUD
		local hud = {}

		-- 10s countdown
		hud.time = 10
		hud.hud_id = player:hud_add({
			hud_elem_type = "text",
			name = "Just a countdown text",
			position = {x=0.4, y=0.4},
			text = tostring(hud.time),
		})
		if not hud.hud_id then
			return false, "Something happened that shouldn't happen"
		end

		-- Everything ok. Add it to our main table
		my_huds[name] = hud
		return true, "Counting down now!"
	end
})

minetest.register_on_leaveplayer(function(player)
	-- Clean up garbage
	my_huds[player:get_player_name()] = nil
end)


minetest.register_globalstep(function(dtime)
	for name, hud in pairs(my_huds) do
		local old_hud_time = hud.time
		hud.time = hud.time - dtime
		if hud.time <= 0 then
			-- Countdown expired. Remove the HUD
			local player = minetest.get_player_by_name(name)
			player:hud_remove(hud.hud_id)
			my_huds[name] = nil
		elseif math.floor(old_hud_time) ~= math.floor(hud.time) then
			-- Counting down. Change the HUD text if necessary
			local player = minetest.get_player_by_name(name)
			player:hud_change(hud.hud_id, "text",
				tostring(math.floor(hud.time + 0.5)))
		end
	end
end)
