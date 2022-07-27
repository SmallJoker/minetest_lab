local fs = [[
    size[2,4]
    real_coordinates[true]
    style_type[image;noclip=false]
    image[-0.5,0.5;1,1;test_1.png]
    style_type[image;noclip=true]
    image[1.5,0.5;1,1;test_1.png]

    item_image[-0.5,1.5;1,1;default:apple]
    item_image[1.5,1.5;1,1;default:apple]

    box[-0.5,2.5;1,1;red]
    box[1.5,2.5;1,1;red]
]];
minetest.register_chatcommand("fstest", {
	func = function(name)
        minetest.show_formspec(name, "test", fs);
		return true;
	end,
})
