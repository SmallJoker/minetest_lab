if true then return end

local modpath = minetest.get_modpath(minetest.get_current_modname())
local data

local function profile(name, func)
	local t0 = minetest.get_us_time()
	func()
	local t1 = minetest.get_us_time()
	print("Function " .. name .. " took " ..
		math.floor((t1 - t0) / 1000 + 0.5) .. " ms")
end

local function generate_PlainText()
	data = {}
	for i = 1, 10E3 do
		local pos = {
			x = math.floor(math.random() * 1000 - 500),
			y = math.floor(math.random() * 1000 - 500),
			z = math.floor(math.random() * 1000 - 500)
		}
		data[pos.x..","..pos.y..","..pos.z] = "some data" .. i
	end
end

local function save_StringConcat()
	for i = 1, 10 do
		local contents = ""
		for pos, dat in pairs(data) do
			contents = contents .. pos .. " " .. "singleplayer" .. " " .. dat .. "\n"
		end
		minetest.safe_file_write(modpath .. "/dump2.dat", contents)
		collectgarbage()
		print("Loop " .. i)
	end
end

local function save_TableConcat()
	for i = 1, 10 do
		local contents = {}
		for pos, dat in pairs(data) do
			contents[#contents + 1] = pos .. " " .. "singleplayer" .. " " .. dat
		end
		minetest.safe_file_write(modpath .. "/dump2.dat", table.concat(contents, "\n"))
		collectgarbage()
		print("Loop " .. i)
	end
end

profile("generate   ", generate_PlainText)
profile("save string", save_StringConcat)
profile("save table ", save_TableConcat)