minetest.override_item("default:stone", {
	tiles = {{
		name = "dirt_big.png",
		tileable_vertical = true,
		tileable_horizontal = true,
		align_style = "world",
		scale = 16
	}}
})
minetest.override_item("stairs:stair_stone", {
	tiles = {{
		name = "dirt_medium.png",
		tileable_vertical = true,
		tileable_horizontal = true,
		align_style = "world",
		scale = 8
	}}
})
minetest.override_item("default:dirt_with_grass", {
	tiles = {{
		name = "covered_medium.png",
		tileable_vertical = true,
		tileable_horizontal = true,
		align_style = "world",
		scale = 8
	}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1, slippery = 4},
})
minetest.override_item("default:stone_with_coal", {
	tiles = {"default_stone2.png^default_mineral_coal.png"}
})


minetest.register_privilege("hay", {
	on_grant = function(name, granter_name)
		print("granted " .. name .. " by " .. (granter_name or ""))
	end,
	on_revoke = function(name, revoker_name)
		print("revoked " .. name .. " by " .. (revoker_name or ""))
	end
})

local time = 4
minetest.register_tool("lab:pickky", {
	description = "Pickaxe",
	inventory_image = "default_tool_stonepick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=4.0, [3]=2.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	on_place = function(itemstack, user)
		local meta = itemstack:get_meta()
		meta:set_tool_capabilities(nil)
		print("ok! " .. time)
		time = time / 2
		return itemstack
	end
})
