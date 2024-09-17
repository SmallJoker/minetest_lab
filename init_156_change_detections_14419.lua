-- Origin: Warr1024 from https://github.com/minetest/minetest/issues/9934

local modname = minetest.get_current_modname()

minetest.register_entity(modname .. ":test", {
	initial_properties = {
		nametag = "quiet",
		visual = "upright_sprite",
		textures = {
			"testentities_upright_sprite1.png",
			"testentities_upright_sprite2.png",
		},
		static_save = false
	},
	on_activate = function(self)
		self.object:set_armor_groups({punch_operable=1})
	end,
	on_step = function(self)
		if self.noise then self.object:set_properties({nametag = "noisy"}) end
	end,
	on_punch = function(self)
		self.object:set_texture_mod("^[transform1")
		self.noise = not self.noise
		if not self.noise then self.object:set_properties({nametag = "quiet"}) end
	end
})

minetest.register_on_joinplayer(function(player)
	local pos = vector.add(player:get_pos(), player:get_look_dir())
	pos.y = pos.y + player:get_properties().eye_height
	minetest.add_entity(pos, modname .. ":test")
end)
