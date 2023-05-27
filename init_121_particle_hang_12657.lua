
minetest.register_chatcommand("p", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local pos = vector.round(player:get_pos())
		local xd, zd, time = 1, 1, 10

		minetest.add_particlespawner({
			amount = 160,
			time = time,
			minpos = {x=pos.x-xd, y=pos.y-0, z=pos.z-zd},
			maxpos = {x=pos.x+xd, y=pos.y+2, z=pos.z+zd},
			minvel = {x=0, y=-1, z=0},
			maxvel = {x=0, y=1, z=0},
			minacc = {x=0, y=-1, z=0},
			maxacc = {x=0, y=1, z=0},
			minexptime = 1.0,
			maxexptime = 2.5,
			minsize = 1.0,
			maxsize = 1.0,
			collisiondetection = true,
			collision_removal = true,
			vertical = false,
  
			texture = "default_furnace_front_active.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 7,
				aspect_h = 7,
				length = -1,
			},
  
			glow = 14,
		})
	end
})

