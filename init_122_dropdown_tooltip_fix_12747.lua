local fs = [[
formspec_version[6]
size[10,10]
dropdown[1,1;2,1;drpdwn;item1,item2;1]
tooltip[drpdwn;foo1]
scrollbar[4,1;0.25,3;vertical;scrbr;0]
tooltip[scrbr;foo2]
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
