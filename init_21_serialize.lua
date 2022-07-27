
local function gen_dummy_binary(len)
	len = len or 256
	local out = ""
	for i = 1, len do
		out = out .. string.char((i + 2) % 256)
	end
	return out
end

local compress_data = gen_dummy_binary()

local m = minetest.get_mod_storage()
local modpath = minetest.get_modpath(minetest.get_current_modname())

local serialized
local deserialized

local function dump_to_file(name, data)
	local file = io.open(modpath .. "/_data_" .. name .. ".txt", "wb")
	file:write(data)
	file:close()
end

-- SECOND STAGE. Check serialization
local c_length = string.len(compress_data)
serialized = minetest.serialize({
	length = c_length,
	data = compress_data
})
local deserialized = minetest.deserialize(serialized)
assert(type(deserialized) == "table", "de-/serialize failed: not a table")
assert(deserialized.length == c_length, "Invalid de-/serialize length")
assert(deserialized.data == compress_data, "Invalid de-/serialize data")


-- THIRD STAGE. Check plain storage
-- write = true

local write = false -- false

if write then
	m:set_string("test", serialized)
end

local metastring = m:get_string("test")
dump_to_file("serialize", serialized)
dump_to_file("get_string", metastring)
assert(metastring == serialized, "Meta storage not reliable")

deserialized = minetest.deserialize(metastring)
-- deserialized = { length = num, data = str }
assert(type(deserialized) == "table", "Invalid deserialize output")
assert(deserialized.length == string.len(deserialized.data),
	"Length invalid. Deserialize failed")
assert(deserialized.data  == compress_data, "De-/compress or decompress failed")

-- FOURTH, FINAL STAGE. Check persistent storage
-- write = false (scroll up, rejoin world)

-- Spoiler: compare files /my_modpath/_data_*.txt after crash