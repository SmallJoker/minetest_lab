minetest.register_chatcommand("x", {
	func = function(name, param)
		minetest.chat_send_player(name, "Please do not crash "
			.. string.rep(" :)", math.floor(2^16 / 3)))
	end
})
