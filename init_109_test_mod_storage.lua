local m = minetest.get_mod_storage()

local DO_WRITE = false
local DO_CHECK = (not DO_WRITE) and true

if DO_WRITE then
	-- Before migration step
	m:from_table() -- Clear
	m:from_table({
		fields = {
			string1 = "hello",
			int1 = 420,
			float = 3.141
		}
	})
	m:set_int("int2", m:get_int("int1") + 100)
	m:set_string("string2", "world")
	m:set_string("string1", "") -- Clear
	m:set_float("float", 0.707)
end

if DO_CHECK then
	-- After migration step
	assert(m:to_table().fields.string2 == "world")
	assert(m:get_int("int2") == 520)
	assert(math.abs(m:get_float("float") - 0.707) < 0.0001)
end

if not DO_CHECK and not DO_WRITE then
core.register_chatcommand("store", {
	func = function(name, param)
		local args = param:split(" ", false, 2)
		if args[1] == "get" and #args == 2 then
			return m:contains(args[2]), m:contains(args[2]) and m:get(args[2]) or "NOT FOUND"
		end
		if args[1] == "set" and #args == 3 then
			m:set_string(args[2], args[3])
			return true, "OK"
		end
		if args[1] == "rm" and #args == 2 then
			m:set_string(args[2], "")
			return true, "OK"
		end
		return false, "Format: /store [get|set|rm] key [value]"
	end
})
end
