local test = minetest.create_detached_inventory("test", {}, "foobar")
test:set_size("main", 1)

minetest.remove_detached_inventory("test") -- this kills the Minetest

local inv = minetest.get_inventory({type="player", name="singleplayer"})
print("init", inv)

minetest.register_on_joinplayer(function(player)
	local inv = minetest.get_inventory({type="player", name="singleplayer"})
	print("join", inv)
end)