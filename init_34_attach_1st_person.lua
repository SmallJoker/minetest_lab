minetest.register_entity("lab:cube", {
	initial_properties = {
		physical = true,
		collide_with_objects = true,
		collisionbox = {-1, -1, -1, 1, 1, 1},
		selectionbox = {-1, -1, -1, 1, 1, 1},
		visual = "cube",
		textures = { "default_sand.png" },
		pointable = true,
	},
})

minetest.register_on_joinplayer(function(player)
	local pos = player:get_pos()
	local ent1 = minetest.add_entity(pos, "lab:cube")
	minetest.after(1, function()
		ent1:set_attach(player, "",
			{x = 0, y = 10, z = 20}, {x = 0, y = 0, z = 0})
	end)
end)

local n = 1000

minetest.register_chatcommand("swi", {
	params = "",
	description = "",
	privs = {},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local item = player:get_wielded_item()

		local time_start = minetest.get_us_time()
		player:set_wielded_item(item)
		local dt1 = minetest.get_us_time() - time_start

		time_start = minetest.get_us_time()
		for i = 1, n do
			player:set_wielded_item(item)
		end
		local dtn = minetest.get_us_time() - time_start

		print("dt1: " .. dt1 .. ", dtn: " .. dtn / n)
	end,
})
