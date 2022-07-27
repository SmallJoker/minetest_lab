local my_formspec =
	"size[10,8]"..
	"no_prepend[]"..
	--"bgcolor[green;true]".. -- modify this however you want
	--"bgcolor[#F00]"..
	""

minetest.register_node(":test:node", {
	description = "test node",
	tiles = {"default_wood.png^heart.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 3},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.show_formspec(clicker:get_player_name(), "my_formspec", my_formspec)
	end,
})