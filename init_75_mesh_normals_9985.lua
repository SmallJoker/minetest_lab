minetest.register_entity("lab:normalx", {
    initial_properties = {
        physical = false,
        collisionbox = {0,0,0,0,0,0},
        selectionbox = {0,0,0,0,0,0},
        visual = "mesh",
        mesh = "icocage.x",
        textures = {"default_stone.png"},
        static_save = false,
    }
})
minetest.register_entity("lab:horsex", {
    initial_properties = {
        physical = false,
        collisionbox = {0,0,0,0,0,0},
        selectionbox = {0,0,0,0,0,0},
        visual = "mesh",
        mesh = "mobs_horse.x",
        textures = {"default_stone.png"},
        static_save = false,
    }
})

minetest.register_chatcommand("spawn", {
	func = function(name)
		local pos = minetest.get_player_by_name(name):get_pos()
		pos.y = pos.y + 2
	    local obj = minetest.add_entity(pos, "lab:horsex")
	    obj:set_properties{visual_size={x=5,y=5,z=5}}
	end
})