minetest.register_on_joinplayer(function(player, last_login)
	local obj = core.create_fake_objectref("player", "markus biggus")
	assert(obj.is_fake_object)
	assert(obj:get_player_name() == "markus biggus")
	obj:set_pos({x = 1, y = 2, z = 3})
	assert(obj:get_pos().z == 3)
end)

core.register_chatcommand("x", {
	func = function(name)
		local player = core.get_player_by_name(name)
		print("call: " .. dump(player:is_fake_player()))
	end
})
