local S = minetest.get_translator("lab")
local FS = function(...)
	return minetest.formspec_escape(S(...))
end
local FC = function(...)
	return minetest.colorize("#f0f", FS(...))
end


core.register_on_joinplayer(function(player_)
	local inv = player_:get_inventory()

	core.after(3, function(player)
		core.show_formspec(player:get_player_name(), "lab:hello",
			"formspec_version[2]" .. 
			"size[8,8]" .. 
			"label[0,1;" .. FC("Hello @1\n[and] welcome @2", "A", "B") .. "]" ..
			"button[1,3;4,2;abcd;" .. FC("Hello @1\n[and] welcome @2", "C", "D") .. "]" ..
			"tooltip[abcd;" .. FC("Hello @1\n[and] welcome @2", "E", "F") .. "]"
		)
	end, player_) -- unsafe
end)
