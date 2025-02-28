-- Written by sfan5, https://github.com/minetest/minetest/pull/15531

local worldmt = Settings(core.get_worldpath() .. "/world.mt")
assert(worldmt:get("backend") == "dummy", "This mod is destructive! Use dummy backend.")

local function foo(pos0, set)
	local m = math.ceil(math.log(#set) / math.log(3))
	local n = 1
	for x1 = 1, m do
	for y1 = 1, m do
	for z1 = 1, m do
		core.swap_node(vector.new(pos0.x + x1 - 1, pos0.y + y1 - 1,
			pos0.z + z1 - 1), {name = set[n]})
		n = n + 1
		if n > #set then
			return
		end
	end
	end
	end
end

core.set_mapgen_setting("mg_name", "singlenode", true)

local variety = {}
core.register_on_mods_loaded(function()
	for name, def in pairs(core.registered_nodes) do
		if def.drawtype == "plantlike" then
			table.insert(variety, name)
		end
	end
end)

local wanted_area = VoxelArea(vector.new(-100, -40, -100), vector.new(100, 40, 100))
core.register_on_generated(function(minp, maxp, blockseed)
	assert(minp.x % core.MAP_BLOCKSIZE == 0)
	for x0 = minp.x, maxp.x, core.MAP_BLOCKSIZE do
	for y0 = minp.y, maxp.y, core.MAP_BLOCKSIZE do
	for z0 = minp.z, maxp.z, core.MAP_BLOCKSIZE do
		local pos0 = vector.new(x0, y0, z0)
		if wanted_area:containsp(pos0) then
			foo(pos0, variety)
		end
	end
	end
	end
end)
