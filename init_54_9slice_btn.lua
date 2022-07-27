local fs = [[
    size[9,4.5]
    real_coordinates[true]
    background9[0,0;2,4.5;fbg.png;true;3]

    style[3d;border=false;bgimg=bg.png;bgimg_hovered=bgh.png;bgimg_pressed=bgp.png;bgimg_middle=3,6]
    button[0.5,0.75;1,0.5;3d;Button]
    image_button[0.5,1.75;1,1;fg.png;3d;]
    item_image_button[0.5,3;1,1;default:apple;3d;]

	style[flat:pressed;padding=10]
    style[flat;border=false;bgimg_hovered=bgh2.png;bgimg_pressed=bgp2.png;bgimg_middle=7]
    button[2,0.75;1,0.5;flat;Button]
    image_button[2,1.75;1,1;fg_test.png;flat;]
    item_image_button[2,3;1,1;default:apple;flat;]

	style[*:pressed;content_offset=0,5]
    style[tab;border=false;bgimg=bg3.png;bgimg_hovered=bgh3.png;bgimg_pressed=bgp3.png;bgimg_middle=3,2,29,29]
    button[3.5,0.75;1,0.5;tab;Button]
    button[4.5,0.75;1,0.5;tab;Button]
    button[5.5,0.75;1,0.5;tab;Button]
    image_button[3.5,1.75;1,1;fg.png;tab;]
    image_button[4.5,1.75;1,1;fg.png;tab;]
    image_button[5.5,1.75;1,1;fg.png;tab;]
    item_image_button[3.5,3;1,1;default:apple;tab;]
    item_image_button[4.5,3;1,1;default:apple;tab;]
    item_image_button[5.5,3;1,1;default:apple;tab;]

    style[3dscale;border=false;bgimg=bg.png;bgimg_hovered=bgh.png;bgimg_pressed=bgp.png]
    button[7,0.75;1,0.5;3dscale;Button]
    image_button[7,1.75;1,1;fg.png;3dscale;]
    item_image_button[7,3;1,1;default:apple;3dscale;]

	style[*:hovered;textcolor=yellow]
    button[8.5,-0.5;1,1;3d;Button]
    button[8.5,1.75;1,1;default;Button]
]];
minetest.register_chatcommand("formspec", {
	func = function(name)
        minetest.show_formspec(name, "test", fs);
		return true;
	end,
})
