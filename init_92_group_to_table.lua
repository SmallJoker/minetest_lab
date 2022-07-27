-- Delay until after alpha texture warnings
minetest.after(1, function()
	local val = minetest.settings:to_table()
	
	print(dump(val["test"]))
end)