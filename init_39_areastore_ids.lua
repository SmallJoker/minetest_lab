minetest.override_item("default:chest", {
	groups = {cracky = 1, falling_node = 1}
})

local mod_data = minetest.get_mod_storage()
local area_data = AreaStore()
local DATA_FIXED_ID = "foo bar test"
local DATA_ANY_ID = "covfefe baz"

-- Load AreaStore if possible
if mod_data:get("area_store") then
	area_data:from_string(minetest.decode_base64(mod_data:get("area_store")))

	-- Compare data
	local area = area_data:get_area(5599, true, true)
	print(">> Any ID = ", dump(area))
	assert(area.data == DATA_FIXED_ID)
	area = area_data:get_area(mod_data:get_int("area_any_id"), true, true)
	print(">> Fixed ID = ", dump(area))
	assert(area.data == DATA_ANY_ID)
else
	print("Creating new AreaStore. Rejoin to test")
end

-- Clear areas
area_data = AreaStore()

-- Add new areas
local id_fixed = area_data:insert_area({x=1,y=1,z=1}, {x=5,y=5,z=5}, DATA_FIXED_ID, 5599)
local id_any   = area_data:insert_area({x=2,y=3,z=4}, {x=6,y=7,z=8}, DATA_ANY_ID)
assert(id_fixed == 5599)
print("<< Save any ID", id_any)
mod_data:set_int("area_any_id", id_any)

-- Save area data
mod_data:set_string("area_store", minetest.encode_base64(area_data:to_string()))
