-- https://github.com/minetest/minetest/issues/15105
-- by jeremyshannon

minetest.register_entity("lab:sprite",{
	initial_properties = {
		visual = "upright_sprite",
		collides_with_objects = false,
		textures = { "testnodes_anim.png",},
		spritediv = { x = 1, y = 4 },
		static_save = false, -- discard on leave
	},
	on_activate = function(self, dtime, moveresult)
		self.init = true
		self.timelimit = 20
		self.object:set_sprite(nil, 4, .5)
	end,
	on_step = function(self, dtime, moveresult)
		self.timer = ( self.timer or 0 ) + dtime
		if self.timer < self.timelimit then return end
		self.object:remove()
	end,
})

local function set_up_entity(pointed_thing)
	local ppos = pointed_thing.under
	if not vector.check(ppos) then return end

	local pos = vector.new(ppos.x, ppos.y + 1, ppos.z)
	return minetest.add_entity(pos, "lab:sprite")
end

minetest.register_craftitem("lab:sprite_item", {
	description = "Animated sprite entity test",
	inventory_image = "testnodes_anim.png^[verticalframe:4,1",
	on_use = function(itemstack, user, pointed_thing)
		set_up_entity(pointed_thing)
	end,
	on_place = function(itemstack, user, pointed_thing)
		local ent = set_up_entity(pointed_thing)
		ent:set_properties({ visual = "sprite" })
	end
})
