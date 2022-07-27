local elements = [[
	button[3,2;2,1;btn2;XXX]
	list[current_player;main;0,0;4,4;]
	button[5,0;2,1;btn;Button]
	button[3,1.5;3,1;btn;Button2]
]]

local fs = [[
	formspec_version[3]
	size[11,10]
	real_coordinates[false]
]] .. elements .. [[
	tooltip[0,0;10,5;<rect_mode tooltip defined after other elements>]

	listcolors[#000;#fff;#f00;#0f0;#00f]

	container[0,6]
	tooltip[0,0;10,5;<rect_mode tooltip defined before other elements>]
]] .. elements .. [[
	container_end[]
]]

minetest.register_on_joinplayer(function(player)
	minetest.show_formspec(player:get_player_name(), "fs_test", fs)
end)

minetest.register_chatcommand("fs", {
	params = "",
	description = "Show the test formspec.",
	privs = {},
	func = function(name, param)
		minetest.show_formspec(name, "fs", fs)
		return true
	end,
})