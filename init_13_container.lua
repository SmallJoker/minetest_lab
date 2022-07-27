minetest.register_on_joinplayer(function(player)
	minetest.show_formspec(player:get_player_name(), "test", [[
		size[4,5]
		label[0,0;Container test]
		container[0.5,0.5]
		button[0,0;3,1;test2;x0.5 y0.5]
		container_end[]
		container[1,1]
		button[0,0.5;3,1;test1;x1 y1]
		container_end[]
		button[0,2.5;3,1;test;No container]
		list[current_player;main;0,4;4,1]
	]])
end)
--[[
			image_button[1.5,1.5;1,1;default_dirt.png;namey;WAHT]
			tooltip[namey;Important text;#00F;#000]
			]]