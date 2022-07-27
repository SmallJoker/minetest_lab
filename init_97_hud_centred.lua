core.register_chatcommand("hud", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		player:hud_add({
		    hud_elem_type = "text",
		    text = "This is an example\ntext with\na\ncouple of\nlines.\n\nThis is the last line.",
		    number = 0xFFFFFF,
		    position = {x=0.5, y=0.5},
		    offset = {x=-0,y=-256},
		    direction = 3,
		    alignment = {x=1,y=1},
		    scale = {x=800,y=600},
		})
	end
})
