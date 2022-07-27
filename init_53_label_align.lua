local boxes = ""
for x = 0, 11 do
	for y = 0, 7 do
		if x % 2 == y % 2 then
			boxes = boxes .. "box["..x..","..y..";1,1;#000000]"
		end
	end
end

local fs = (
	"formspec_version[3]"..
	"size[12,8]"..
	boxes..
	"box[2.95,0.95;0.1,0.1;gray]"..
	"label[3,1;Right Aligned]"..

	"box[2.95,1.95;0.1,0.1;gray]"..
	"style_type[label;halign=center]"..
	"label[3,2;Center Aligned]"..

	"box[2.95,2.95;0.1,0.1;gray]"..
	"style_type[label;halign=left]"..
	"label[3,3;Left Aligned]"..
	---
	"box[0.95,4.95;0.1,0.1;gray]"..
	"style_type[label;valign=top;halign=right]"..
	"label[1,5;Top Centered]"..

	"box[0.95,5.95;0.1,0.1;gray]"..
	"style_type[label;valign=center]"..
	"label[1,6;Center Centered]"..

	"box[0.95,6.95;0.1,0.1;gray]"..
	"style_type[label;valign=bottom]"..
	"label[1,7;Bottom Centered]"..
	---
	"box[4,5.25;1,0.25;gray]"..
	"box[4,5.75;1,0.25;gray]"..
	"style_type[label;newline_spacing=0.25]"..
	"label[4,5; | Label\n | with\n | 0.25\n | spacing\n | Yay]"..
	---
	"box[5.95,2.95;0.1,0.1;gray]"..
	"style_type[label;valign=top;halign=center]"..
	"vertlabel[6,3;TOP]"..

	"box[6.95,2.95;0.1,0.1;gray]"..
	"style_type[label;valign=center]"..
	"vertlabel[7,3;CENTER]"..

	"box[7.95,2.95;0.1,0.1;gray]"..
	"style_type[label;valign=bottom]"..
	"vertlabel[8,3;BOTTOM]"..
	---
	"box[8.95,0.95;0.1,0.1;gray]"..
	"style_type[label;halign=left]"..
	"vertlabel[9,1;LEFT]"..
				
	"box[9.95,0.95;0.1,0.1;gray]"..
	"style_type[label;halign=center]"..
	"vertlabel[10,1;CENTER]"..
				
	"box[10.95,0.95;0.1,0.1;gray]"..
	"style_type[label;halign=right]"..
	"vertlabel[11,1;RIGHT]"..
	---
	"box[9.3333,4;0.3333,1;gray]"..
	"box[10,4;0.3333,1;gray]"..
	"style_type[label;newline_spacing=0.3333;halign=center]"..
	"vertlabel[9,4;-VERTLABEL\n-WITH\n-0.3333\n-SPACING\n-COOL!]"
)

minetest.register_chatcommand("fstest", {
	func = function(name)
        minetest.show_formspec(name, "test", fs);
		return true;
	end,
})
