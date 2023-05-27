local no_flicker = 1 / 4096

minetest.register_node("lab:sneak_tp", {
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { oddly_breakable_by_hand = 3 },
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {{
	         -1 / 2 + no_flicker,
	         -1 / 2 + no_flicker,
	         -1 / 32 + 1,
	         1 / 2 - no_flicker,
	         1 / 2 - no_flicker,
	         1 / 32 + 1
         }},
	},
})

