-- By GreenXenith, https://github.com/minetest/minetest/issues/15652

local step = 0
core.register_globalstep(function(dtime)
    step = step + 1
    print(step, dtime) -- You should see this a few thousand times; dtime will drop significantly after 61(?) steps
    if step > 60 then -- arbitrary number of steps I chose
        error("this is an error")
    end
    print("you cant see me after 60 steps")
end)
