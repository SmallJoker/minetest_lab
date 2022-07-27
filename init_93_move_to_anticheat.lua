core.register_chatcommand("move", {
	func = function(name, param)
		local player = core.get_player_by_name(name)
		local parent = player:get_attach()
		if not parent then
			return false, "Not attached"
		end
		local pos = parent:get_pos()
		local f
		f = function()
			if not parent:get_pos() or not player:get_pos() then
				return
			end
			pos.z = pos.z + 5 -- must be big enough or bug won't appear
			parent:move_to(pos, true)
			print("cart: ", core.pos_to_string(parent:get_pos()), "player: ", core.pos_to_string(player:get_pos()))
			minetest.after(0.5, f)
		end
		f()
		return true, "ok."
	end,
})
