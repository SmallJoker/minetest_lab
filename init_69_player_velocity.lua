minetest.register_on_joinplayer(function(player)
    player:set_properties{damage_texture_modifier = "^[transformFY"}
end)