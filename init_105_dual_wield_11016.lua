minetest.register_on_joinplayer(function(player)
	player:get_inventory():set_size("offhand", 1)
end)

minetest.register_chatcommand("swap", {
	help = "Swap hands",
	func = function(name)
		local player = minetest.get_player_by_name(name)

		if not player then
			return false, "Need to be online"
		end

		local inv = player:get_inventory()

		local main = player:get_wielded_item()
		local offhand = inv:get_stack("offhand", 1)

		inv:set_stack("offhand", 1, main)
		player:set_wielded_item(offhand)
	end,
})