local players = {}

core.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_list("hand", {"default:cobble"})
	players[#players + 1] = player
	player:get_entity_name()
	player:get_look_pitch()

	core.after(5, function()
    	core.show_formspec(player:get_player_name(), "lab:testy",
    		"invsize[9,7]"..
    		"no_prepends[]"..
    		"list[current_player;hand;8,6;1,1;]"
    	)
	end)
	
	core.add_particle(vector.new(), vector.new(), 
		vector.new(), 20, 1, false, "default_dirt.png")
end)

core.set_mapgen_params()
core.env:set_mapgen_params()

local time = 0
core.register_globalstep(function(dtime)
	time = time + dtime
	if time < 3 then
		return
	end
	time = time - 3
	for i, player in ipairs(players) do
		player:get_entity_name()
		player:get_look_pitch()
	end
end)