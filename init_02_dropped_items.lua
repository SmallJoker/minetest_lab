-- From https://github.com/minetest/minetest/pull/6803#issuecomment-353639173

minetest.register_chatcommand("a", {
	func = function(name, param)
		local r = tonumber(param)
		if not r or r <= 0 then
			r = 5
		end

		local d = 10
		local int = 1 / d

		minetest.chat_send_all("Spawning " .. (r * r * d) .. " entities, with r=" .. r .. " and int=" .. int .. ")")

		minetest.after(0.1, function()
			local pos = minetest.get_player_by_name(name):get_pos()
			for x = 0, 2*r, int do
				for z = 0, 2*r, int do
					minetest.add_item({ x = x + pos.x, y = pos.y, z = z + pos.z}, "default:sapling")
				end
			end

			minetest.chat_send_all("Done!")
		end)
	end
})

minetest.registered_entities["__builtin:item"].initial_properties.collide_with_objects = true
minetest.registered_entities["__builtin:item"].try_merge_with = function()
	return false
end