core.register_chatcommand("fs", {
	func = function(name)
		core.show_formspec(name, "test:fs",
			"size[8,5]" ..
			"bgcolor[#FFFFFF]" ..
			"image[0,0;1,1;" .. core.formspec_escape("ignore.png^[lowpart:30:halo.png") .. "]" ..
			"image[0,1;1,1;" .. core.formspec_escape("ignore.png^(crack_anylength.png^[verticalframe:5:3)") .. "]" ..
			"image[0,2;1,1;" .. core.formspec_escape("ignore.png^(crack_anylength.png^[sheet:1x5:0,3)") .. "]" ..
			""
		)
	end,
})
