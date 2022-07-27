-- Source: https://github.com/minetest/minetest/issues/9640#issuecomment-612431262

local detached_test_inv_exists = false
local function show_inv_formspec(name)
	print("opening inv test formspec...")
	local inv_name = "fs_test_detached_inv"

	-- See whether the inventory can post-correct it
	minetest.show_formspec(name, "fs_test_inv", "formspec_version[3]"..
		"size["..(9 + 7 * 0.25)..",10]"..
		"list[detached:"..inv_name..";baum;0.5,0.5;3,2;0]"..
		"list[current_player;main;0.5,3.25;8,4;]"
	)
	minetest.after(1, function()
	if not detached_test_inv_exists then
		local inv = minetest.create_detached_inventory(inv_name, {
			allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
				return count
			end,
			allow_put = function(inv, listname, index, stack, player)
				return stack:get_count()
			end,
			allow_take = function(inv, listname, index, stack, player)
				return stack:get_count()
			end,
			--~ on_move = function(inv, from_list, from_index, to_list, to_index, count, player),
			on_put = function(inv, listname, index, stack, player)
				minetest.remove_detached_inventory(inv_name)
				detached_test_inv_exists = false
			end,
			--~ on_take = function(inv, listname, index, stack, player),
		})
		inv:set_size("baum", 6)
		detached_test_inv_exists = true
	end
	end)

	print("finished.")
end

minetest.register_chatcommand("fs", {
	params = "",
	description = "Show the test formspec.",
	privs = {},
	func = function(name, param)
		show_inv_formspec(name)
		return true
	end,
})
