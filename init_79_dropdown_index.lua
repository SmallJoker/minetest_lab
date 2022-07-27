minetest.register_globalstep(function(dtime)
	local player = minetest.get_player_by_name("singleplayer")
	if player then
		local controls = player:get_player_control()
		if controls.jump then
			minetest.show_formspec("singleplayer", "formspec:test", "formspec_version[3]"..
				"size[4,3.5]"..
				"dropdown[.5,.5;3,1;value;Value 1,Value 2,Value 3;2]"..
				"dropdown[.5,2;3,1;index;Index 1,Index 2,Index 3;2]"..
				"dropdown_index_event[index;true]"..
			"")
		end
	end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.value then
		minetest.chat_send_all(fields.value)
	end
	if fields.index then
		minetest.chat_send_all(fields.index)
	end
end)