-- For https://github.com/luanti-org/luanti/pull/16397

local IS_SINGLENODE = core.get_mapgen_setting("mg_name") == "singlenode"
print(IS_SINGLENODE and "GENERATE NEW" or "MODIFY FLAT")

core.register_on_generated(function(minp, maxp, seed)
	local vm, emin, emax = core.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
	local data = vm:get_data()

	local c_snow = core.get_content_id("default:snow")
	local c_gravel = core.get_content_id("default:gravel")
	local c_air = core.get_content_id("air")

	if IS_SINGLENODE then
		-- If "singlenode": generate gravel at Y = 1 to spawn snow decoration
		-- onto the biomes {"tundra", "tundra_beach"}. (Minetest Game)
		if maxp.y >= 1 and minp.y <= 1 then
			for z = minp.z, maxp.z do
				local vi = area:index(minp.x, 1, z)
				for x = minp.x, maxp.x do
					data[vi] = c_gravel
					vi = vi + 1
				end
			end
		end
	else
		-- If "flat" mapgen: remove all snow
		for z = minp.z, maxp.z do
		for y = minp.y, maxp.y do
			local vi = area:index(minp.x, y, z)
			for x = minp.x, maxp.x do
				if data[vi] == c_snow then
					data[vi] = c_air
				end
				vi = vi + 1
			end
		end
		end
	end

	vm:set_data(data)

	core.generate_decorations(vm, minp, maxp, true)
	-- ^ Code unused: no snow
	--   Code active: snow

	vm:calc_lighting()
	vm:write_to_map()
end)
