core.register_chatcommand("fs", {
	func = function(name, param)
		local player = core.get_player_by_name(name)
		if not player then return end -- ncurses
		core.show_formspec(name, "foobar",
			[[
			formspec_version[7]
			size[10,11]
			style_type[table;font=mono]
			tablecolumns[text;text;text]
			table[0,1;10,9;machines;Type,Position,Priority,sbz_resources:storinator,(2\, 9\, -10),100,pipeworks:accelerator_tube_3,(2\, 9\, -7),50;1]
			]])
	end
})
