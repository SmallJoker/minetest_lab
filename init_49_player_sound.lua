minetest.register_chatcommand("sound", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		minetest.sound_play("default_chest_close", {
			object = player,
			max_hear_distance = 1*64
		})
	end
})

minetest.register_craft({
    output = "default:stone",
    recipe = {{"default:dirt", "default:dirt", "default:stick"}},
    replacements = {{"default:dirt", "default:dirt 2"}}
})