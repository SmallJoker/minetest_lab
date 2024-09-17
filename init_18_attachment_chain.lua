minetest.register_entity("lab:cube", {
    initial_properties = {
        hp = 10,
        physical = false,
        collide_with_objects = true, -- Collide with other objects if physical = true
        collisionbox = {-1.5, -0.5, -1.5, 1.5, 0.5, 1.5},
        selectionbox = {-1.5, -0.5, -1.5, 1.5, 0.5, 1.5},
        visual = "cube",
        visual_size = {x = 1, y = 1},
        textures = { "default_stone.png" },
        use_texture_alpha = false,
        automatic_rotate = 0.3,
        static_save = false,
        pointable = true,
    },
	on_rightclick = function(self, clicker)
		if clicker:get_attach() then
			clicker:set_detach()
		else
			clicker:set_attach(self.object, "", {x=3,y=10,z=3}, {x=0,y=0,z=90})
		end
		minetest.chat_send_all(minetest.pos_to_string(clicker:get_pos()) .. ", " ..
			((clicker:get_attach()) and "attached" or "detached"))
	end,
	on_punch = function(self, puncher, _, _, _, _)
		self.object:set_detach()
		--error("lockout")
	end,
	on_detach = function(self, parent)
		self.object:set_attach(parent, "", {x=30,y=0,z=30}, {x=45,y=45,z=0})
		print("on_detach")
	end,
})

minetest.after(3, function()
    local pos = minetest.get_player_by_name("singleplayer"):get_pos()
    local ent1 = minetest.add_entity(pos, "lab:cube")
    local ent2 = minetest.add_entity(pos, "lab:cube")
    local ent3 = minetest.add_entity(pos, "lab:cube")
    minetest.after(1, function()
    	ent1:set_attach(ent2, "", {x=30,y=0,z=30}, {x=90,y=0,z=0})
    	ent2:set_attach(ent3, "", {x=-30,y=30,z=0}, {x=0,y=90,z=0})
    end)
end)