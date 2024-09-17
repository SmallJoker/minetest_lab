minetest.register_chatcommand("c", {
    description = "Crash Minetest",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)

        minetest.add_particlespawner({
            amount = 50,
            time = 0.01,
            minpos = player:get_pos(),
            maxpos = player:get_pos(),
            minvel = vector.new(-10, -10, -10),
            maxvel = vector.new(10, 10, 10),
            minexptime = 0.3,
            maxexptime = 0.3,
            minsize = 0.4,
            maxsize = 0.4
        })
    end
})
