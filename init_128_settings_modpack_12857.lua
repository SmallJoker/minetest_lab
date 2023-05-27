local settings_world = Settings(minetest.get_worldpath() .. "/world.mt")
local settings_default = Settings(minetest.get_modpath("default") .. "/mod.conf")
local settings_gane = Settings(minetest.get_modpath("default") .. "/../../game.conf")

local settings_modpack = Settings(minetest.get_modpath("technic") .. "/../modpack.conf")


print(dump(settings_world:get_names()))
