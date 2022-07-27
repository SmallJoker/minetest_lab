local elements = [[
	list[current_player;main;0,0;4,4;]
	button[5,0;2,1;btn;Button]
	button[3,1.5;3,1;btn;Button2]
]]

local fs = [[
	size[11,10]
]] .. elements .. [[
	tooltip[0,0;10,5;<rect_mode tooltip defined after other elements>]
	container[0,6]
	tooltip[0,0;10,5;<rect_mode tooltip defined before other elements>]
]] .. elements .. [[
	container_end[]
]]

minetest.register_chatcommand("fstest", {
	params = "",
	description = "Show the test formspec.",
	privs = {},
	func = function(name, param)
		minetest.show_formspec(name, "fs", fs)
		return true
	end,
})
