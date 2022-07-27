
local w = 1
local h = 1
local time = 0
minetest.register_globalstep(function(dtime)
	if not minetest.get_player_by_name("singleplayer") or
			minetest.get_server_uptime() < 3 then
		return
	end
	time = time + dtime
	if time < 1 then
		return
	end
	time = time - 1

	w = w + 2
	if w > 10 then
		h = h + 1
		w = 1
	end
	minetest.show_formspec("singleplayer", "aaa", ([[
            size[%i,%i]
            background[0,0;%i,%i;lab_9slice.png;false;20]
       ]]):format(w, h, w, h))
end)