minetest.register_craft({
	type = "shapeless",
	output = 'default:mese',
	recipe = {'default:coal_lump', 'group:wood'}
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:mese_crystal',
	recipe = {'default:coal_lump', 'default:wood'}
})