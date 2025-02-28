local lorem = [[
Lorem ipsum dolor sit amet,
consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et
dolore magna aliquyam erat,
sed diam voluptua.
At vero eos et accusam
et justo duo
dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem
ipsum dolor sit amet.
]]

core.register_chatcommand("t", {
	func = function(name)
		local function btn(x, y)
			return (
				("button[%.1f,%.1f;%d,%d;btn_%d_%d;%d %d]"):format(x*3.5,y*1.5, 3,1, x,y, x,y)
				..
				("tooltip[btn_%d_%d;%s;green;black]"):format(x,y, lorem)
			)
		end
		local fs = {
			"size[14,8;true]"
		}
		for y = 0, 4 do
		for x = 0, 4 do
			fs[#fs + 1] = btn(x, y)
		end
		end
		core.show_formspec(name, "lab:test", table.concat(fs))
	end
})
