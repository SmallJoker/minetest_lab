minetest.register_on_player_hpchange(function(player, hp_change, reason)
	print("damaged", hp_change, dump(reason))
end, false)

minetest.register_node("lab:dangernoodle", {
	description = "hurt on rightclick",
	tiles = {"default_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	walkable = false,
	damage_per_second = 1,
})