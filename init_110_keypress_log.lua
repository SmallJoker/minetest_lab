local h = {}; local t = {}
minetest.register_on_joinplayer(function(p)
	local n = p:get_player_name(); h[n] = p:hud_add({
		hud_elem_type = "text",
		position = {x = 0.22, y = 0.22},
		scale = {x = 2, y = 2},
		number = 0xFFFFFF,
		style = 4,
	}); t[n] = ""
end)
minetest.register_on_leaveplayer(function(p)
	local n = p:get_player_name(); h[n] = nil; t[n] = nil
end)
local function z(c)
	local function k(s) return c[s] and s:upper() or s end
	return ("      "..k("up").."          "..k("dig").." "..k("place").."\n"..
	k("left").." "..k("down").." "..k("right").."  "..k("jump").." "..k("sneak").."\n"..
	"                 "..k("aux1").."  "..k("zoom"))
end
minetest.register_globalstep(function(_)
	for _, p in ipairs(minetest.get_connected_players()) do
		local n = p:get_player_name(); local i = h[n]
		if i then
			local s = z(p:get_player_control())
			if s ~= t[n] then p:hud_change(i, "text", s); t[n] = s end
		end
	end
end)
