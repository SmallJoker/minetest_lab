minetest.register_chatcommand("c", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local value = minetest.is_yes(param) and "auto" or (5 / 1000)
		minetest.show_formspec(name, "lab:scrollcontainer",
			"formspec_version[7]"..
			"size[12,8]"..
			"scroll_container[0,0;10,4;scrbar2;vertical;" .. value .. "]"..
				"label[0.5,0.5;nest]"..
				"list[current_player;main;0,1;8,4;]"..
			"scroll_container_end[]"..
			"scrollbar[10.1,0;0.5,4;vertical;scrbar2;0]"..
			-- Scale
			"button[11,0;1,1;;0]"..
			"button[11,1;1,1;;1]"..
			"button[11,2;1,1;;2]"..
			"button[11,3;1,1;;3]"..
			"button[11,4;1,1;;4]"..
			""
		)
	end
})