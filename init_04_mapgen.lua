local ffi
if false then
	local ie = minetest.request_insecure_environment()
	ffi = ie.require("ffi")
	ffi.cdef[[
	typedef struct {
		uint16_t id;
		uint8_t param1;
		uint8_t param2;
	} MapNode;
	void VoxelManip_get(void **vm, MapNode **data);
	]]
end

local c_air = minetest.get_content_id("air")
local c_ice = minetest.get_content_id("default:ice")
local avg = 0

function generate_this_stuff(minp, maxp, seed)
	local t1 = os.clock()
	local sidelen1d = maxp.x - minp.x + 1
	local sidelen3d = {x=sidelen1d, y=sidelen1d, z=sidelen1d}

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data

	if ffi then
		local __data = ffi.new("MapNode*[0]")
		ffi.C.VoxelManip_get(vm, __data)
		data = __data[0]
	else
		data = vm:get_data()
	end

	local nvals_caves = minetest.get_perlin_map({
		offset = 0,
		scale = 1,
		spread = {x=64, y=64, z=64},
		octaves = 4,
		seed = -11842,
		persist = 0.4,
		flags = "eased"
	}, sidelen3d):get3dMap_flat(minp)

	local nixyz = 1
	for z = minp.z, maxp.z do
	for y = minp.y, maxp.y do
		local vi = area:index(minp.x, y, z)
		for x = minp.x, maxp.x do
			local cave = nvals_caves[nixyz] + math.max(-1, y / 32)

			if ffi then
				if cave < 0 then
					data[vi].id = c_ice
				else
					data[vi].id = c_air
				end
				data[vi].param2 = 0
			else
				if cave < 0 then
					data[vi] = c_ice
				else
					data[vi] = c_air
				end
			end

			nixyz = nixyz + 1
			vi = vi + 1
		end
	end
	end

	if not ffi then
		vm:set_data(data)
		vm:set_lighting({day=0, night=0})
	end

	vm:calc_lighting()
	vm:write_to_map()
	vm:update_liquids()
	local dtime = (os.clock() - t1) * 1000
	avg = (avg == 0) and dtime or (avg * 25 + dtime) / 26
	

	minetest.log("action", "this = " ..
		math.ceil(dtime) .. " ms, avg = " ..
		math.ceil(avg) .. " ms")
end

minetest.after(0, table.insert,
	minetest.registered_on_generateds, 1, generate_this_stuff)
