local fs = [[
    size[9,4.5]
    real_coordinates[true]
    background9[0,0;2,4.5;fbg.png;true;3]

    style[tab;border=false;bgimg=bg3.png;bgimg_middle=3,2,29,29]
	style[tab:hovered;bgimg=bgh3.png]
	style[tab:pressed;bgimg=bgp3.png]
    button[3.5,0.75;1,0.5;tab;Button]
    button[4.5,0.75;1,0.5;tab;Button]
    image_button[3.5,1.75;1,1;fg.png;tab;]
    image_button[4.5,1.75;1,1;fg.png;tab;]
    item_image_button[3.5,3;1,1;default:apple;tab;]
    item_image_button[4.5,3;1,1;default:apple;tab;]

    style[3dscale;border=false;bgimg=bg.png]
	style[3dscale:hovered;bgimg=bgh.png]
	style[3dscale:pressed;bgimg=bgp.png]
    button[7,0.75;1,0.5;3dscale;Button]
    image_button[7,1.75;1,1;fg.png;3dscale;]
    item_image_button[7,3;1,1;default:apple;3dscale;]

    button[8.5,-0.5;1,1;3d;Button]
    button[8.5,1.75;1,1;default;Button]
]]

minetest.register_chatcommand("formspec", {
	func = function(name)
        minetest.show_formspec(name, "test", fs)
		return true
	end,
})
