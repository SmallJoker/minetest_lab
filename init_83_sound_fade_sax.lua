local handle
minetest.register_on_joinplayer(function(player)
	minetest.after(1, function()
		handle = minetest.sound_play({
			name = "sax_violin", -- custom, long sound here
			gain = 1.0
		}, {
			to_player = player:get_player_name(),
			gain = 0.2,
			loop = true
		})
	end)
end)

minetest.register_chatcommand("s", {
	description = "Modify sound. <step> <gain>",
	privs = {},
	func = function(name, param)
		param = param:split(" ")
		local step = tonumber(param[1]) or 0
		local gain = tonumber(param[2]) or 0
		minetest.sound_fade(handle, step, gain);
	end
})

