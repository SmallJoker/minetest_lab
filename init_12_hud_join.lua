local t = core.string_to_privs("test, test1")
print(dump(t))

local form1 = "size[4,4]"..
	"button_exit[1,1;2,2;exit;Click me!]"
local form2 = "size[4,4]"..
	"button_exit[1,1;2,2;exit2;Click again!]"

minetest.register_node("lab:node", {
	description = "Place me and right click me!",
	tiles = {
		"default:dirt"
	},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.show_formspec(clicker:get_player_name(), "formspec_error:form1", form1)
	end,
})

minetest.register_on_player_receive_fields(function (player, formname, fields)
	if formname == "formspec_error:form1" then
		if fields.exit then
			minetest.show_formspec(player:get_player_name(), "formspec_error:form2", form2)
		end
	elseif formname == "formspec_error:form2" then
		if fields.exit2 then
			minetest.chat_send_player(player:get_player_name(), "Hi")
		end
	end
end)

local ids = {}
local value = 5

core.register_on_joinplayer(function(player)
	player:hud_set_flags({
		healthbar = false,
		breathbar = false
	})
	ids[#ids + 1] = player:hud_add({
		hud_elem_type = "statbar",
		position = { x=0.5, y=(0.92 + (#ids) / 50) },
		text = "heart.png",
		number = value,
		direction = 0,
		size = { x=24, y=24 },
		offset = { x=(-10*24)-25, y=-(48+24+16)},
	})
	print("ID: " .. ids[#ids])
	
end)

local time = 0
minetest.register_globalstep(function(dtime)
	local player = minetest.get_connected_players()[1]

	time = time + dtime
	if time < 0.5 then
		return
	end
	time = time - 0.5

	for i, id in pairs(ids) do
		value = value % 20 + 2
		player:hud_change(id, "number", value)
	end
end)

--[[local time = 0
minetest.register_globalstep(function(dtime)
	time = time + dtime
	if time < 0.1 then
		return
	end
	time = time - 0.1
	for i, player in pairs(minetest.get_connected_players()) do
		player:set_look_horizontal(math.pi)
	end
end)]]