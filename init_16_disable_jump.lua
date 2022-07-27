minetest.register_on_joinplayer(function(player)
	player:set_physics_override({
		new_move = false
	})
print("Old move OK!")
end)

core.override_item("default:water_source", {
	groups = {
		disable_jump = 1,
		water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1
	}
})

core.override_item("default:water_flowing", {
	groups = {
		disable_jump = 1,
		water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1
	}
})

core.override_item("default:leaves", {
	groups = {
		disable_jump = 1,
		cracky = 3
	}
})

core.override_item("default:ladder_wood", {
	groups = {
		disable_jump = 1,
		cracky = 3
	}
})