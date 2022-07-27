local my_formspec =
	"size[10,8]"..
	--~ "position[0.2,0.7]"..
	--~ "anchor[0,1]"..
	"button[8,1;1,1;bla;Bla]"..
	"scrollbar[7.1,1;0.5,6;vertical;scrbar;0]"..
	"scroll_container[1,1;8,6;scrbar;down;0.06]"..
		"button[0,1;1,1;baum;Baum]"..
		--~ "container[0,0]"..
		"button[0,10;1,1;planze;Pflanze]"..
		"pwdfield[2,2;1,1;baum2;Baum]"..
		--~ "container_end[]"..
		"list[current_player;main;4,4;1,5;]"..
		"box[2,5;3,2;#ffff00]"..
		"image[1,10;3,2;bubble.png]"..
		"image[3,1;bubble.png]"..
		"item_image[2,6;3,2;default:mese]"..
		"label[2,15;bla baum\nfoo bar]"..
		--~ "textarea[2,10;5,6;txtarea;Baum;bla]"..
		"item_image_button[2,3;1,1;default:dirt_with_grass;itemimagebutton;ItemImageButton]"..
		--~ "tooltip[planze;Blatt;#f00;#000]"..
		"tooltip[0,11;3,2;Blatt;#f00;#000]"..
		"box[0,11;3,2;#00ff00]"..
		--~ "checkbox[2,25;chb;ChB;false]",
		"container[0,18]"..
			"scroll_container[1,2;3,2;scrbar2;right;0.1]"..
				"label[10,0;nest]"..
				"button[0,0;6,1;butnest;Nest]"..
				"bgcolor[#aa0a]"..
			"scroll_container_end[]"..
			"scrollbar[1,0;3.5,0.3;horizontal;scrbar2;0]"..
		"container_end[]"..
		--~ "tablecolumns[text,bla]"..
		--~ "table[1,23;3,1;tbl;a,b,c,d;2]"..
		--~ "textlist[0,5;2,0.5;txtlst;a,b,c]"..
		"dropdown[0,6;2;hmdrpdwn;apfel,birne;1]"..
		"image_button[0,4;2,2;bubble.png;bubblebutton;bbbbtt;false;true;heart.png]"..
		--~ "tabheader[-1,9;mytabheader;a,b,c;2;false;false]"..
		--~ "background[2,4;2,2;default_wood.png;true]"..
		"bgcolor[#00aa]"..
	"scroll_container_end[]"..
	--~ "textarea[5,0.5;1,1;scrtxtarea;Baum;blablaajk adfkjgn \n akfjb]"..
	--~ "bgcolor[;true]"..
	--~ "bgcolor[#0000]"..
	""
	
core.register_on_joinplayer(function(player)
	core.after(5, function(name)
		core.show_formspec(name, "lab:testy", my_formspec)
	end, player:get_player_name())
end)