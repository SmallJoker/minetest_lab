local csa = print
local function format_all(params)
	if #params == 4 then
		-- player
		local action = params[2]
		local info = params[4]
		local ret = ("action=%s (%s) | "):format(action, params[1]:get_player_name())
		if action == "move" then
			return (ret .. "[%s,%d] -> [%s,%d] count=%d"):format(
				info.from_list, info.from_index, info.to_list, info.to_index, info.count)
		else
			return (ret .. "[%s,%d] %s"):format(
				info.listname, info.index, info.stack:to_string())
		end
	elseif #params == 7 then
		-- move
		return ("[%s,%d] -> [%s,%d] count=%d (%s)"):format(
			params[2], params[3], params[4], params[5], params[6], params[7]:get_player_name())
	elseif #params == 5 then
		-- put/take
		return ("[%s,%d] %s (%s)"):format(
			params[2], params[3], params[4]:to_string(), params[5]:get_player_name())
	else
		error("Unknown format: " .. dump(params))
	end
end

local function hook_fcn(def_table, name)
	local func = def_table[name]
	def_table[name] = function(...)
		csa("\t" .. name .. (" "):rep(30 - #tostring(name))
			.. " | " .. format_all({...}))
		local val = func and func(...)
		if val ~= nil then
			csa("\t -> " .. tostring(val))
			return val
		end
	end
end

-- Nodes
local node_overrides = {
	"allow_metadata_inventory_put",
	"allow_metadata_inventory_take",
	"allow_metadata_inventory_move",
	"on_metadata_inventory_put",
	"on_metadata_inventory_take",
	"on_metadata_inventory_move",
}
local chest_def = minetest.registered_items["default:chest_locked"]
for _, v in ipairs(node_overrides) do
	hook_fcn(chest_def, v)
end
minetest.override_item("default:chest_locked", {}) -- update defs

-- Players
-- 1: Allow
-- 2: Action
minetest.register_allow_player_inventory_action(function() return 10 end)
minetest.register_on_player_inventory_action(function() end)
minetest.register_on_player_inventory_action(function() end)
hook_fcn(minetest.registered_allow_player_inventory_actions, 1)
hook_fcn(minetest.registered_on_player_inventory_actions, 2)

minetest.register_chatcommand("fs", {
	func = function(name)
		local pos = minetest.get_player_by_name(name):get_pos()
		local npos = minetest.find_node_near(pos, 4, {"default:chest_locked"})
		local detinv_name = "creative_" .. name

		-- Detached inventory
		local detinv = minetest.detached_inventories[detinv_name]
		if not detinv._hooked then
			detinv._hooked = true
			for _, v in ipairs({"allow_move", "allow_put", "allow_take",
					"on_move", "on_put", "on_take"}) do
				hook_fcn(detinv, v)
			end
		end

		core.show_formspec(name, "test", ([[
			size[7,5]
			list[detached:%s;main;0,1.5;7,2]
			list[nodemeta:%d,%d,%d;main;0,0;7,1]
			list[current_player;main;0,4;7,1]
			listring[]
		]]):format(detinv_name, npos.x, npos.y, npos.z))
	end
})

minetest.register_node("lab:inventory", {
	description = "Inventory tester",
	tiles = {"default_gold_block.png"},
	groups = {oddly_breakable_by_hand = 1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "size[8,9]list[context;main;0,0;8,4;]list[current_player;main;0,5;8,4;]listring[]")
		meta:get_inventory():set_size("main", 32)
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		print("Allow put: "..stack:to_string())
		return stack:get_count()
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		print("Allow take: "..stack:to_string())
		return stack:get_count()
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		print("Put: "..stack:to_string())
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		print("Take: "..stack:to_string())
	end,
})