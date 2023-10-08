minetest.register_chatcommand("fs", {
	func = function(name, param)
		minetest.show_formspec(name, "freeze",
			"size[4,4]" ..
			"background9[2,2;-1,-1;default_cobble.png;false;20]" .. -- problematic
			"background[0,0;-4,-4;default_cobble.png]" -- already works
		)
	end
})
