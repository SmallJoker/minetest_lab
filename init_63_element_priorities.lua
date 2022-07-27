local fs =
	[[
		formspec_version[3]
		size[6,6]
		button[1,1;4,1;btn;Hello]
		button[1,2;4,1;btn;Hello]
		button[1,3;4,1;btn;Hello]
		button[1,4;4,1;btn;Hello]
		image[2,2;1,1;default_dirt.png]
		label[1,4;#####################]
		item_image[3,3;1,1;default:dirt]
		box[0,0;3,3;#F00]
		hypertext[0.2,1;10,9;test;<action name=test>Test</action><global hovercolor=green><action name=test>Test</action>"]
	]]

minetest.register_chatcommand("fs", {
	func = function(name)
		minetest.show_formspec(name, "lab:formspec", fs)
	end
})