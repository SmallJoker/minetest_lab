local test = minetest.create_detached_inventory("test_detached_inv", {})
minetest.remove_detached_inventory("test_detached_inv")
minetest.register_on_mods_loaded(function()
	minetest.remove_detached_inventory("test_detached_inv")
end)
minetest.after(0,
	minetest.remove_detached_inventory, "test_detached_inv")




-- Original: 2018-08-30

core.register_on_joinplayer(function(player)
	-- Init public and restricted inventory
	local inv_all = core.create_detached_inventory("foobar_all", {
		allow_put = function() print("put all?") return 1 end
	})
	inv_all:set_size("bazz1", 4)
	local inv_me = core.create_detached_inventory("foobar_me", {
		allow_put = function() print("put me?") return 1 end
		
	}, "singleplayer")
	inv_me:set_size("bazz2", 4)

	core.show_formspec(player:get_player_name(), "test", [[
		size[4,5]
		list[detached:foobar_all;bazz1;0,0;4,1]
		list[detached:foobar_me;bazz2;0,2;4,1]
		list[current_player;main;0,4;4,1]
	]])

	-- Check whether the deletion works correctly
	core.after(8, function()
		core.remove_detached_inventory("foobar_all")
	end)
	core.after(12, function()
		core.remove_detached_inventory("foobar_me")
	end)
end)