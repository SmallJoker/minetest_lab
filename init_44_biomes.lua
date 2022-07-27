minetest.clear_registered_biomes()
for heat_point = 0,10 do
	for humidity_point = 0,10 do
		minetest.register_node("lab:"..heat_point.."he_"..humidity_point.."hu",{
			description = "Heat: "..heat_point..", Humidity: "..humidity_point,
			tiles = {"he"..heat_point..".png^hu"..humidity_point..".png"},
		})
		
		minetest.register_biome({
			name = "he"..heat_point.."hu"..humidity_point,
			y_min = -31000,
			y_max = 31000,
			node_stone = "lab:"..heat_point.."he_"..humidity_point.."hu",
			heat_point = heat_point*10,
			humidity_point = humidity_point*10,
		})
	end
end