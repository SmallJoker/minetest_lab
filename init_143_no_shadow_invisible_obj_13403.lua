local entity_name = "lab:entity"
minetest.register_entity(entity_name, {
	visual = "cube",
})
minetest.after(5, function()
	local player = minetest.get_player_by_name("singleplayer")
	local pos = player:get_pos()
	local entity = minetest.add_entity(pos, entity_name)
	entity:set_attach(player)
end)
