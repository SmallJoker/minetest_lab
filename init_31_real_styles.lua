
local real_styles = function()
	return [[
	size[12,12]real_coordinates[true]
	container[-1,-1]
	image_button[0,0;1,1;logo.png;;1x1]
	image_button[1,0;2,2;logo.png;;2x2]
	button[0,2;1,1;;1x1]button[1,2;2,2;;2x2]
	style_type[button;bgimg_pressed=default_dirt.png;bgimg=default_snow.png;border=false]
	item_image[0,4;1,1;air]item_image[1,4;2,2;air]
	item_image_button[0,6;1,1;default:tree;;1x1]
	item_image_button[1,6;2,2;default:tree;;2x2]
	container_end[]
	field[3,.5;3,.5;name;Field;text]pwdfield[6,.5;3,1;name;Password Field]field[3,1;3,1;;Read-Only Field;text]
	textarea[3,2;3,.5;name;Textarea;text]textarea[6,2;3,2;name;Textarea;text
		more text]textarea[3,3;3,1;;Read-Only Textarea;text\nmore text]
	textlist[3,4;3,2;name;Textlist,Perfect Coordinates;1;false]tableoptions[highlight=#ABCDEF75;background=#00000055;border=false]table[6,4;3,2;name;Table,Cool Stuff,Foo,Bar;2]
	dropdown[3,6;3,1;name;This,is,a,dropdown;1]dropdown[6,6;3,2;name;I,am,a,bigger,dropdown;5]
	image[0,8;3,2;ignore.png]
	box[3,7;3,1;#00A3FF]
	button[3,8.25;3,.5;name;]button[3,9.25;3,.5;name;]
	checkbox[3,8.5;name;Check me!;false]checkbox[3,9.5;name;Uncheck me now!;true]
	scrollbar[0,11.5;11.5,.5;horizontal;name;500]
	scrollbar[11.5,0;.5,11.5;vertical;name;0]
	list[current_player;main;6,8;4,4;1]
	]]..
	"button[9,0;2.5,1;name;]button[9,1;2.5,1;name;]button[9,2;2.5,1;name;]label[9,4.5;This is a label.\nLine\nLine\nLine\nEnd]"..
	"button[9,3;1,1;name;]vertlabel[9,4;VERT]label[10,3;HORIZ]"
end

local real_wiki = function()
	return [[
	real_coordinates[true]size[20,12]
	button[0,0;20,0.5;;Air - Ingame Minetest Wiki | Minetest Browser]image_button[0,0;20,0.5;;;;true;false;]
	button_exit[18.75,0;1.25,0.5;;X]field[3,0.5;14,0.5;name;;https://wiki.minetest.net/Air]
	button[0,0.5;1,0.5;;<]button[1,0.5;1,0.5;;>]button[2,0.5;1,0.5;;Reload]button[17,0.5;1,0.5;;Home]button[18,0.5;2,0.5;;Settings]
	scrollbar[19.65,1;0.35,11;vertical;;0]
	box[0.125,4;2.25,7.875;#999999]image_button[0.25,4;2,0.5;;;.. minetest.colorize(#55A9FF, Main Page) ..;true;false;]image_button[0.25,4.5;2,0.5;;;.. minetest.colorize(#55A9FF, Links to here) ..;true;false;]
	image_button[0.25,5;2,0.5;;;.. minetest.colorize(#55A9FF, Recent Changes) ..;true;false;]image_button[0.25,5.5;2,0.5;;;.. minetest.colorize(#55A9FF, Random Page) ..;true;false;]
	box[0.125,1.125;2.25,2.75;#999999]image_button[0.25,1.25;2,2;logo.png;;;true;false;]image_button[0.25,3.25;2,0.5;;;.. minetest.colorize(#55A9FF, Minetest Wiki) ..;true;false;]
	textarea[2.5,1.5;13.65,5.25;;----- Air -----;Air is a transparent node, which can be walked and passed through by players without any resistance.s]
	label[2.5,11.125; See also:]button[4.25,11.375;2,0.5;;Ignore]button[6.5,11.375;2,0.5;;Airlike]button[8.75,11.375;2,0.5;;Cheesecake]
	box[16.15,1.5;3,5.25;#46783255]item_image[16.15,2;3,3;formspec:node]
	image_button[16.15,1.5;3,0.5;no_screenshot.png;;Air;true;false;]image_button[16.15,1.5;3,0.5;;;;true;false;]
	image[16.15,5;3,1.75;no_screenshot.png]textarea[16.4,5.25;3,1.5;;;A gaseous substance that can't be dug in normal gameplay.]
	]]
end

local box_colors = function()
	return [[
	size[4.5,7]
	real_coordinates[true]
	style_type[box;colors=lightseagreen,lightseagreen,#0000008c,#0000008c]
	box[0,-1;4.5,1;]
	style_type[box;colors=#0000008c,#0000008c,lightseagreen,lightseagreen]
	box[0,7;4.5,1;]
	style_type[box;bordercolors=#20B2AA55;borderwidths=1,0,-1,0]
	box[0,3.5;4.5,0;]

	container[0.25,0.25]
	style_type[box;colors=black,#FF0000,white,black;bordercolors=black;borderwidths=1]
	box[0,0;3,3;]
	box[3.25,0;0.25,3;#00000000]
	style_type[box;colors=#FF0000,#FF0000,#FF000000,#FF000000;bordercolors=black;borderwidths=1]
	box[3.75,0;0.25,3;]
	style_type[box;colors=#FF0000,#FF0000,#FFFF00,#FFFF00]
	box[3.25,0;0.25,0.5;]
	style_type[box;colors=#FFFF00,#FFFF00,#00FF00,#00FF00]
	box[3.25,0.5;0.25,0.5;]
	style_type[box;colors=#00FF00,#00FF00,#00FFFF,#00FFFF]
	box[3.25,1;0.25,0.5;]
	style_type[box;colors=#00FFFF,#00FFFF,#0000FF,#0000FF]
	box[3.25,1.5;0.25,0.5;]
	style_type[box;colors=#0000FF,#0000FF,#FF00FF,#FF00FF]
	box[3.25,2;0.25,0.5;]
	style_type[box;colors=#FF00FF,#FF00FF,#FF0000,#FF0000]
	box[3.25,2.5;0.25,0.5;]
	container_end[]

	container[0.25,3.75]
	style_type[box;bordercolors=black;borderwidths=1]
	box[0,0;3,3;]
	style_type[box;colors=#FF0000,#FFFF00,#808080,#808080]
	box[0,0;0.5,3;]
	style_type[box;colors=#FFFF00,#00FF00,#808080,#808080]
	box[0.5,0;0.5,3;]
	style_type[box;colors=#00FF00,#00FFFF,#808080,#808080]
	box[1,0;0.5,3;]
	style_type[box;colors=#00FFFF,#0000FF,#808080,#808080]
	box[1.5,0;0.5,3;]
	style_type[box;colors=#0000FF,#FF00FF,#808080,#808080]
	box[2,0;0.5,3;]
	style_type[box;colors=#FF00FF,#FF0000,#808080,#808080]
	box[2.5,0;0.5,3;]
	style_type[box;colors=white,white,black,black;bordercolors=black;borderwidths=1]
	box[3.25,0;0.25,3;]
	style_type[box;colors=#FF0000,#FF0000,#FF000000,#FF000000;bordercolors=black;borderwidths=1]
	box[3.75,0;0.25,3;]
	container_end[]
	]]
end


core.register_chatcommand("fstest", {
	func = function(name)
		core.show_formspec(name, "lab:testy", box_colors())
	end
})

