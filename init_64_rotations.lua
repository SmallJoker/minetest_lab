--[[
Functions to test:
	vector.rotate(v, rot)
	vector.rotate_around_axis(v, axis, angle)
	vector.rotation_to_horizontal(rot)
	vector.rotation_to_vertical(rot)
	vector.directions_to_rotation(forward, up)
]]


minetest.register_entity("lab:node", {
	initial_properties = {
		visual = "cube",
		visual_size = {x = 0.2, y = 0.6, z = 1},
		textures = {"default_wood.png"},
		collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
})

local function check(name, func, wanted, ...)
	print(name .. "<   " .. minetest.pos_to_string(func(...)))
	print(name .. " -> " .. minetest.pos_to_string(wanted))
end


local actions = {
	""
}

minetest.register_chatcommand("rot", {
	func = function(name, params)
	end
})