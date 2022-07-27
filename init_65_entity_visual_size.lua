minetest.register_entity("lab:sphere", {
    initial_properties = {
        physical = false,
        collide_with_objects = false,
        collisionbox = {0,0,0,0,0,0},
        selectionbox = {0,0,0,0,0,0},
        pointable = false,
        visual = "mesh",
        mesh = "character.b3d",
        textures = {"character.png"},
        use_texture_alpha = true,
        glow = 14,
        static_save = false,
        backface_culling = false
    }
})

minetest.register_chatcommand("spawn", {
	func = function(name)
		local pos = minetest.get_player_by_name(name):get_pos()
		pos.y = pos.y + 1
	    local obj = minetest.add_entity(pos, "lab:sphere")
	    obj:set_properties{visual_size={x=5,y=5,z=5}}
	end
})