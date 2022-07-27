local def = minetest.registered_entities["__builtin:item"]
local old_punch = def.on_punch
local old_activate = def.on_activate

def.initial_properties.hp_max = 100
def.on_death = old_punch
def.on_punch = function(self, puncher, t, caps)
	self.object:set_hp(self.object:get_hp() -
		math.min(1, t / caps.full_punch_interval) * 2)
end
def.on_activate = function(self, staticdata, dtime_s)
	old_activate(self, staticdata, dtime_s)
	self.object:set_armor_groups({fleshy = 1})
end
