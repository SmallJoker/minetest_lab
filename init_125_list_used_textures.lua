-- Helper script to list all used textures

local pattern = ""
local filter = "technic"

-- [name.png] = count
local textures = {}

local function parse_texture(texture)
	if not texture or #texture == 0 then
		return
	end

	local part_c, part_n = texture:match("([a-z0-9_]+%.%a+)(.*)")
	if part_c and (not filter or part_c:find(filter, 1, true)) then 
		textures[part_c] = (textures[part_c] or 0) + 1
	end

	-- Leftover string
	parse_texture(part_n)
end

local function find_textures_recursive(t)
	if type(t) ~= "table" then
		return
	end

	for k, v in pairs(t) do
		if type(v) == "table" then
			find_textures_recursive(v)
		elseif type(v) == "string" then
			parse_texture(v)
		end
	end
end

minetest.register_on_mods_loaded(function()
	for name, def in pairs(minetest.registered_items) do
		find_textures_recursive(def.tiles)
		find_textures_recursive(def.overlay_tiles)
		find_textures_recursive(def.inventory_image)
		find_textures_recursive(def.inventory_overlay)
		find_textures_recursive(def.wield_image)
		find_textures_recursive(def.wield_overlay)
	end

	local sorted = {}
	for name in pairs(textures) do
		sorted[#sorted + 1] = name
	end
	table.sort(sorted)
	for _, name in pairs(sorted) do
		print(name)
	end
end)

--[[
find -type f -name "technic_*" -exec basename {} \; | sort >textures_existing.txt
]]