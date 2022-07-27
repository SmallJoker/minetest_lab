minetest.register_on_punchplayer(function(player)
	--player:set_hp(player:get_hp() - 1)
	return false
end)

minetest.register_on_dieplayer(function(player, reason)
	print("on_dieplayer", dump(reason))
end)

minetest.register_on_player_hpchange(function(player, hp_change, reason)
	print("on_player_hpchange", hp_change, dump(reason))
end, false)

minetest.register_craftitem(":danger_noodle", {
	inventory_image = "default_stick.png",
	description = "DANGER NOODLE",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.ref then
			pointed_thing.ref:set_hp(-69, { totally_rigged = false })
		else
			user:set_hp(-69, { totally_rigged = true })
		end
		itemstack:take_item()
		return itemstack
	end
})