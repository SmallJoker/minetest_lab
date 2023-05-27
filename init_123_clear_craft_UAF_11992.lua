minetest.register_tool("lab:tool1", {
    description = "tool1",
    inventory_image = "unittests_stick.png",
})

minetest.register_tool("lab:tool2", {
    description = "tool2",
    inventory_image = "unittests_stick.png",
})

minetest.register_tool("lab:tool3", {
    description = "tool3",
    inventory_image = "unittests_stick.png",
})

--minetest.register_alias_force("lab:tool2", "lab:tool3")
-- LOCATION 2

minetest.register_craft({
    output = "lab:tool2 5 545",
    recipe = {{"lab:tool1"}},
})

-- LOCATION 1
--minetest.register_alias_force("test:tool2", "test:tool4")


--minetest.clear_craft({
--    recipe = {{"lab:tool1"}},
--})

--print(dump(minetest.get_all_craft_recipes("lab:tool2")))
