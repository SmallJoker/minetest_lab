local fs1 = (
	"size[10,10]"..
	"real_coordinates[true]"..

	"button[0,0;1,1;;In (-10)]"..
	"style_type[box;colors=red,yellow,green,blue;bordercolors=#FF000055,#0000FF55,#00FF0055,#FF00FF55;borderwidths=-10]"..
	"box[1,1;3,3;]"..

	"button[5,0;1,1;;Out (+10)]"..
	"style_type[box;bordercolors=#FF000055,#0000FF55;borderwidths=10]"..
	"box[6,1;3,3;]"..

	"button[1,5.2;3,0.5;;Uneven Border]"..
	"style_type[box;colors=#ffffff8c;bordercolors=#00ffff8c;borderwidths=5,10,15,20]"..
	"box[1,5;3,1;]"..

	"style_type[box;colors=;borderwidths=2]"..
	"box[5,5;4,4;]"..
	"label[5.15,4.85;Box Area]"..
	"field[5.25,5.5;3.5,0.5;name;Name:;]"..
	"field[5.25,6.5;3.5,0.5;date;Date:;]"..
	"field[5.25,7.5;3.5,0.5;whatever;Stuff:;]"..
	"button[6.75,8.25;2,0.5;submit;Submit]"..

	"style_type[box;colors=blue,blue,#0000FF00,#0000FF00;borderwidths=0]"..
	"box[1,7;3,2;]"
)
local fs2 = (
	"size[4.5,7]"..
	"real_coordinates[true]"..
	"style_type[box;colors=lightseagreen,lightseagreen,#0000008c,#0000008c]"..
	"box[0,-1;4.5,1;]"..
	"style_type[box;colors=#0000008c,#0000008c,lightseagreen,lightseagreen]"..
	"box[0,7;4.5,1;]"..
	"style_type[box;bordercolors=#20B2AA55;borderwidths=1,0,-1,0]"..
	"box[0,3.5;4.5,0;]"..

	"container[0.25,0.25]"..
	"style_type[box;colors=black,#FF0000,white,black;bordercolors=black;borderwidths=1]"..
	"box[0,0;3,3;]"..
	"box[3.25,0;0.25,3;#00000000]"..
	"style_type[box;colors=#FF0000,#FF0000,#FF000000,#FF000000]"..
	"box[3.75,0;0.25,3;]"..
	"style_type[box;colors=#FF0000,#FF0000,#FFFF00,#FFFF00;borderwidths=]"..
	"box[3.25,0;0.25,0.5;]"..
	"style_type[box;colors=#FFFF00,#FFFF00,#00FF00,#00FF00]"..
	"box[3.25,0.5;0.25,0.5;]"..
	"style_type[box;colors=#00FF00,#00FF00,#00FFFF,#00FFFF]"..
	"box[3.25,1;0.25,0.5;]"..
	"style_type[box;colors=#00FFFF,#00FFFF,#0000FF,#0000FF]"..
	"box[3.25,1.5;0.25,0.5;]"..
	"style_type[box;colors=#0000FF,#0000FF,#FF00FF,#FF00FF]"..
	"box[3.25,2;0.25,0.5;]"..
	"style_type[box;colors=#FF00FF,#FF00FF,#FF0000,#FF0000]"..
	"box[3.25,2.5;0.25,0.5;]"..
	"container_end[]"..

	"container[0.25,3.75]"..
	"style_type[box;colors=;bordercolors=black;borderwidths=1]"..
	"box[0,0;3,3;]"..
	"style_type[box;colors=#FF0000,#FFFF00,#808080,#808080;borderwidths=]"..
	"box[0,0;0.5,3;]"..
	"style_type[box;colors=#FFFF00,#00FF00,#808080,#808080]"..
	"box[0.5,0;0.5,3;]"..
	"style_type[box;colors=#00FF00,#00FFFF,#808080,#808080]"..
	"box[1,0;0.5,3;]"..
	"style_type[box;colors=#00FFFF,#0000FF,#808080,#808080]"..
	"box[1.5,0;0.5,3;]"..
	"style_type[box;colors=#0000FF,#FF00FF,#808080,#808080]"..
	"box[2,0;0.5,3;]"..
	"style_type[box;colors=#FF00FF,#FF0000,#808080,#808080]"..
	"box[2.5,0;0.5,3;]"..
	"style_type[box;colors=white,white,black,black;bordercolors=black;borderwidths=1]"..
	"box[3.25,0;0.25,3;]"..
	"style_type[box;colors=#FF0000,#FF0000,#FF000000,#FF000000]"..
	"box[3.75,0;0.25,3;]"..
	"container_end[]"
)

minetest.register_chatcommand("fs1", {
	params = "",
	description = "Show the test formspec.",
	privs = {},
	func = function(name, param)
		minetest.show_formspec(name, "fs", fs1)
		return true
	end,
})
minetest.register_chatcommand("fs2", {
	params = "",
	description = "Show the test formspec.",
	privs = {},
	func = function(name, param)
		minetest.show_formspec(name, "fs", fs2)
		return true
	end,
})