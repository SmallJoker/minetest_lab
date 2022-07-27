dofile(minetest.get_modpath("lab") .. "/init_18_attachment_chain.lua")

local def = minetest.registered_entities["lab:cube"]
def.on_rightclick = function(self, clicker)
	if clicker:get_attach() then
		clicker:set_detach()
	else
		local parent, _, position, rotation, _ = self.object:get_attach()
		if not parent then
			parent = self.object
		end
		clicker:set_attach(parent, "", {x=13,y=10,z=13}, {x=0,y=0,z=-90})
		if parent ~= self.object then
			self.object:set_attach(clicker, "", position, rotation, true)
		end
	end
end
