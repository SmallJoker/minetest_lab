minetest.register_chatcommand("fs", {
	description = "Show the test formspec.",
	privs = {},
	func = function(name, param)
	minetest.show_formspec(name, "test:font",
		"formspec_version[3]"..
		"size[12,16.5]"..

		"style_type[*;font=mono,font_size=15]"..
		"style_type[label;font=normal;font_size=17]"..
		"style_type[vertlabel;font=bold;font_size=17]"..
		"style_type[button;font=mono,bold;font_size=+3]"..
		"style_type[field;font=italic,bold;font_size=*0.5]"..
		
		"label[.5,.5;Header text]"..
		"vertlabel[5,.5;Vertical]"..
		"button[.5,1;3,1;;Button]"..
		"field[.5,2.5;3,1;_;;Best Fonts]"..
		"pwdfield[4,2.5;3,1;;]"..
		"textarea[.5,4;6.5,2;_;;Wow, isn't this great stuff? Yay!\nI'm just loving these fonts!]"
	)
	end
})