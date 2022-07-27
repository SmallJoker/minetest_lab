-- Minetest Lua mod to have a rudimentary display of the biomes in your world
-- Written by Krock/SmallJoker

local STEPSIZE = 32
local X_RADIUS = 1000
local Z_RADIUS = 1000
local CHARACTERS = {
	"x", ".", "+", "@", "#",
	"▨", "□", "■",
	"○", "●",
	"▷", "▶",
	"⬟", "⬠",
	"⬥", "⬦",
	"⭙", "⦿", "✪", "✠"
}

minetest.after(2, function()
	print("Seed: " .. minetest.get_mapgen_setting("seed"))
	print("Stepsize: " .. STEPSIZE)
	print("X-Radius: " .. X_RADIUS)
	print("Z-Radius: " .. Z_RADIUS)

	local biome_names = {}
	for z = -Z_RADIUS, Z_RADIUS, STEPSIZE do
		local x_slice = {}
		for x = -X_RADIUS, X_RADIUS, STEPSIZE do
			local data = minetest.get_biome_data({
				x = x,
				y = 10,
				z = z
			})
			local name = minetest.get_biome_name(data.biome)
		
			local found = table.indexof(biome_names, name)
			if found < 0 then
				found = #biome_names + 1
				biome_names[found] = name
			end
			x_slice[#x_slice + 1] = CHARACTERS[found]
		end
		print(table.concat(x_slice, " "))
	end
	
	print("Assignments:")
	for i, name in ipairs(biome_names) do
		print(("  %s  -  %s"):format(CHARACTERS[i], name))
	end
end)