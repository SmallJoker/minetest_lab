local fs_alt = [[
    size[2,2]
    style_type[animated_image;noclip=false]
    animated_image[1.5,0.5;1,1;animated.jpg;4,100,]
    animated_image[0.5,0.5;1,1;animated.png;4,100,]
]]

local fs = [[
    size[2,2]
    style_type[animated_image;noclip=false]
    animated_image[1.6,0.5;1,1;anim1;animated.jpg;4;300;3]
    animated_image[0.5,0.5;1,1;anim2;animated.png;4;300]
]]
minetest.register_chatcommand("fs", {
	func = function(name)
        minetest.show_formspec(name, "test", fs);
		return true;
	end,
})
