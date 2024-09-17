-- Code origin: https://github.com/minetest/minetest/pull/14224

minetest.register_chatcommand("crashme", {
    func = function(name)
        minetest.show_formspec(name, "vframe:crashme", [[
            size[1,1]
            bgcolor[#FFFFFF]
            image[0,0;1,1;crack_anylength.png^\[verticalframe:0:0]
            image[0,0;1,1;crack_anylength.png^\[sheet:0x0:1,1]
        ]])
    end,
})
