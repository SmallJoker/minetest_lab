minetest.register_chatcommand("f", {
	func = function(name, param)
		local texmod = table.concat({
			"[fill:96x64:red", -- background (to be upscaled)
			"^", "(", -- force create new texture
			"[combine:48x32",
			":0,16,16=default_chest_front.png", -- bottom left quarter (texture is 16x16)
			":16,-8,16=%s",                     -- top right quarter, placeholder
			")",
		})
		-- New clients: any input texture size is fine
		--              wanted output size: 96x64
		local texmod_32 = texmod:format("testformspec_bg_9slice.png") -- 32x32

		-- Old clients: expected width must be the same as the texture size for visual compatibility
		--              wanted output size: 48x32
		local texmod_16 = texmod:format("testformspec_node.png") -- 16x16

		minetest.show_formspec(name, "lab:combinetest", table.concat({
			"formspec_version[7]",
			"size[10,9]",
			"image[2,0.2;6,4;", minetest.formspec_escape(texmod_32), "]",
			"image[2,4.8;6,4;", minetest.formspec_escape(texmod_16), "]"
		}))
		return true, "OK!"
	end
})
