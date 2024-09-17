
local worldmt = Settings(minetest.get_worldpath() .. "/world.mt")
assert(worldmt:get("backend") == "dummy", "This mod is destructive! Use dummy backend.")

minetest.register_decoration({
	name = "default:testdeco",
	deco_type = "lsystem",
	place_on = {"default:dirt_with_grass", "default:sand"},
	sidelen = 80,
	fill_ratio = 0.005,
	y_max = 31000,
	y_min = 1,
	treedef = {
		axiom="FFFFFA",
		rules_a="[&&&F][&&&++++F][&&&----F]",
		trunk="default:coral_skeleton",
		leaves="alias_1234",
		angle=30,
		iterations=2,
		random_level=0,
		trunk_type="single",
		thin_branches=true,
	},
})

minetest.unregister_item("default:coral_skeleton")
minetest.register_alias("default:coral_skeleton", "default:cobble")
minetest.register_alias("alias_1234", "default:permafrost_with_stones")
