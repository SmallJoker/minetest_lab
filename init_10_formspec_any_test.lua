
core.register_on_joinplayer(function(player_)
	local inv = player_:get_inventory()
	--inv:set_list("hand", {"default:cobble"})

	core.after(6, function(player)
	core.show_formspec(player:get_player_name(), "lab:testy",
		--"formspec_version[2]"..
		"size[10,8]"..
		"no_prepend[]"..


		"background[0,0;10,8;lab_9slice.png;false;20]" ..
		--"style_type[field;noclip=true;border=false;textcolor=#FF0]"..
		"list[current_player;main;5,6;3,2;]"..
		"list[current_player;hand;9,6;1,1;]"..
		"textlist[4,4;4,2;foo;a,b,c,d]" ..
		"dropdown[1,7.5;2;category;a,b,c,d,e,f,g,h;1]" ..
		-- Book edit
		"field[0.5,1;3.5,1;title;Title:;" ..
			core.formspec_escape("Taking the hobbits to Isengard") .. "]" ..
		"textarea[0.5,1.5;3.5,4;text;Contents:;" ..
			core.formspec_escape("The hobbits the hobbits\nto Isengard") .. "]" ..
		-- Empty book
		"field[4.5,1;3.5,1;title2;"..minetest.colorize("#0F0", "Title:") .. ";]" ..
		"label[4,3;"..minetest.colorize("#0F0", "ffetre") .. "dasds]" ..
		"textarea[0.5,5.5;3.5,4;text2;Contents:;]" ..
		-- Server description (pre e6e5fa3, 0.4.16 stable)
		"textarea[4,1.6;4.23,2.9;;" ..
minetest.colorize("#F00", [[Madman drummer bummers
Indians in the summer
With a teenage diplomat
In the dumps with the mumps
As the adolescent pumps]] .. ";]") ..
		-- Readonly textarea with title
		"textarea[4.6,5.85;3.7,1.5;;This is a fancy title" ..
		";Never gonna give you up, never gonna let you down]"
	)
	end, player_)
end)
