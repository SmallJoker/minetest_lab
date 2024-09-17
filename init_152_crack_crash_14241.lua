minetest.register_chatcommand("crashme", {
    func = function(name)
        minetest.show_formspec(name, "vframe:crashme", [[
            size[5,5]
			image[0,0;1,1;blank.png^[crack:0:1:1]
        ]])
    end,
})
