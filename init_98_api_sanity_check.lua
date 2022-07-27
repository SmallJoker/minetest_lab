minetest.get_heat(vector.new())

minetest.generate_ores(1,vector.new(),vector.new(),1)
print(dump(minetest.get_biome_data(vector.new())))
