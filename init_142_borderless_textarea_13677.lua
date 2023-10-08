local text = [[
line 01
line 02
line 03
line 04
line 05
line 06
line 07
line 08
line 09
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20
]]

minetest.register_chatcommand("formspec", {
	func = function(name, param)
		minetest.show_formspec(name, "mymod:form",
			"size[4,4]" ..
			"style_type[textarea;border=false]" ..
			"textarea[0.2,0.2;4,4;text;Test;" .. text .. "]")
    end
})