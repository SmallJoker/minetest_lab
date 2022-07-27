local defs = {
	plain = {
		base_color = "red",
		type = "plain",
		textures = { "ignored", "params", "ok", "foo", "bar", "test" },
		clouds = true
	},
	regular = {
		type = "regular",
		clouds = true,
		sky_color = {
			day_sky = "#AAF",
			day_horizon = "#55F",
			dawn_sky = "#FAA",
			dawn_horizon = "#F55",
			night_sky = "#AFA",
			night_horizon = "#5F5",
			indoors = "#000",
			fog_sun_tint = "#FF6",
			fog_moon_tint = "#F6A",
			--fog_tint_type = "default",
			fog_tint_type = "custom",
		},
		_sun = {
			visible = true,
			texture = "sun.png",
		}
	},
	noclouds_regular = {
		type = "regular",
		clouds = false,
		_sun = {
			visible = false,
		}
	},
	noclouds_plain = {
		base_color = "red",
		type = "plain",
		clouds = false,
		_sun = {
			visible = true,
			texture = "default_dirt.png",
		}
	},
	skybox = {
		type = "skybox",
		textures = {
			"default_dirt.png", "default_sand.png",
			"default_wood.png", "default_stone.png",
			"default_cobble.png", "default_brick.png"
		},
		clouds = true,
	},
	skybox_err = {
		type = "skybox",
		clouds = false,
		textures = {}
	}
}

minetest.register_chatcommand("sky", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not defs[param] then
			param = "plain"
		end
		player:set_sky(defs[param])
		player:set_stars({
			--visible = false,
			count = 5000,
			scale = 2,
			visible_at_day = true,
		})
		player:set_sun(defs[param]._sun)
	
		print(dump(player:get_stars()))
		return true, "Set sky to " .. param
	end
})