minetest.register_on_joinplayer(function(player)
    local physics=player:get_physics_override()
    physics.jump=3
    player:set_physics_override(physics)
end)
minetest.register_on_player_hpchange(function(player, hp_change, reason)
    if reason.type=='fall' then
        return 0
    else
        return hp_change
    end
end, true)