local text = [[
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
vero eos et accusam et justo duo dolore set ea rebum. Stet clita kasd
gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum
dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos
et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea
takimata sanctus est Lorem ipsum dolor sit amet.
]]
text = (text:gsub("\n", "")):rep(2)

function print_stuff(name)
	minetest.chat_send_all(text)
	--print(dump(core.get_player_information(name)))
	minetest.after(2, print_stuff, name)
end

core.register_on_joinplayer(function(player)
	core.after(5, print_stuff, player:get_player_name())
end)