minetest.register_chatcommand("g", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local pos = player:get_pos()
		local objs = minetest.get_objects_in_area(vector.add(pos, 4), vector.add(pos, -4))
		for i, obj in ipairs(objs) do
			local ent = obj:get_luaentity()
			print(i, ent and ent.name or "<player>")
		end 
	end
})