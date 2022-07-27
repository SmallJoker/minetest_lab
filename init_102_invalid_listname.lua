minetest.register_on_joinplayer(function(player)
	local meta = minetest.get_meta(player:get_pos())
	meta:get_inventory():set_lists({
		[" "] = {""}
	})
	meta:from_table({
		inventory = {[" "] = {""}}
	})
	minetest.get_inventory({
		type="player",
		name=player:get_player_name()
	}):set_list(" ", {""})
end)
