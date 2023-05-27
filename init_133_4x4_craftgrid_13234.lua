minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("craft", 4*4)
	inv:set_width("craft", 4)
end)

minetest.register_craft({
    type = "shapeless",
    output = 'default:mese',
    recipe = {
		-- 5x stick, 4x apple, 3x stone, 1x water bucket
        "default:stick",
        "default:stick",
        "default:apple",
        "default:stick",
        "default:apple",
        "bucket:bucket_water",
        "default:stick",
        "default:apple",
        "default:stone",
        "default:stick",
        "default:apple",
        "default:stone",
        "default:stone",
    },
	replacements = {
		{ "bucket:bucket_water", "bucket:bucket_empty" },
		{ "default:stone", "default:cobble 4" },
	}
})
