-- https://github.com/minetest/minetest/issues/14499
--by Fatalerror42O

local flip = false
minetest.register_tool("lab:shitty_test", {
    description = "the dark times are upon us",
    on_use = function(itemstack, user, pointed_thing)
        flip = not flip
        if flip then
            user:set_fov(80,false,.25)
        else
            user:set_fov(80,false,0)
        end
    end
})
