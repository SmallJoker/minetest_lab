-- Written by sfan5 https://gist.github.com/sfan5/1a124eb496a39734f53fb4daffc47bee

local GROUND_LEVEL = 1
local DEMO_GENNOTIFY = false

local c_filler = core.get_content_id("default:stone")

local global_buffer = {}

local function profile(descr, func)
	local pt = 0
	local b = {}
	return function(...)
		local dt = core.get_us_time()
		local r = {func(...)}
		dt = core.get_us_time() - dt
		table.insert(b, dt)
		if pt ~= os.time() then
			pt = os.time()
			local s = 0
			for _, n in ipairs(b) do
				s = s + n
			end
			print(("%s took %.1fms (%d samples)"):format(descr, s / #b / 1000, #b))
			b = {}
		end
		return unpack(r)
	end
end


local function generate(vm, minp, maxp, blockseed)
	local va
	do
		local pos1, pos2 = vm:get_emerged_area()
		va = VoxelArea:new({MinEdge = pos1, MaxEdge = pos2})
	end

	print("inner " .. core.pos_to_string(minp) .. " -> " .. core.pos_to_string(maxp))
	print("blockseed: " .. blockseed)

	if minp.y > GROUND_LEVEL then
		return
	end
	local data = vm:get_data(global_buffer)
	for i in va:iter(minp.x, minp.y, minp.z, maxp.x, math.min(maxp.y, GROUND_LEVEL), maxp.z) do
		data[i] = c_filler
	end
	vm:set_data(data)

	core.generate_ores(vm, minp, maxp)
	core.generate_decorations(vm, nil, nil, true)

	vm:calc_lighting()

	-- Demonstrates the use of user-defined gennotify
	if DEMO_GENNOTIFY then
		local pos = {}
		if maxp.y > GROUND_LEVEL then
			for x = minp.x, maxp.x, 16 do
			for z = minp.z, maxp.z, 16 do
				pos[#pos+1] = vector.new(x, GROUND_LEVEL+1, z)
			end
			end
		end
		core.save_gen_notify("flatgen:place_light", pos)
	end
end

core.register_on_generated(generate)
--core.register_on_generated(profile("generate", generate))
