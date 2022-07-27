
core.settings:set("mg_flags", "nocaves,nodecorations")
local t

t = core.settings:get_flags("mg_flags")
print(dump(t))
assert(t.caves == false);
assert(t.dungeons == true);
assert(t.light == true);
assert(t.decorations == false);
assert(t.biomes == true);

core.settings:set("mg_flags", "nodecorations,biomes")
t = core.settings:get_flags("mg_flags")
print(dump(t))
assert(t.caves == true);
assert(t.dungeons == true);
assert(t.light == true);
assert(t.decorations == false);
assert(t.biomes == true);

core.settings:remove("mg_flags")

print("MG settings: " .. dump(core.get_mapgen_setting("mg_flags")))
print("mgv7_spflags: " .. minetest.get_mapgen_setting("mgv7_spflags"))
