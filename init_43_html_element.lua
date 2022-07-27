local fs1 = [=[
<global halign=justify valign=center background=#CCF color=#444 actioncolor=darkblue margin=10>
<center><bigger>Furnace</bigger></center>
<style color=black>Furnaces</style> are <action name="crafting">crafted</action> and used by the player for the purpose of cooking food and <action name="smelting">smelting</action> various items.
<item name=default:furnace float=right width=128 rotate=yes>
<style color=black>Type:</style> Solid block
<style color=black>Drops:</style> Itself
<style color=black>Physics:</style> No
<style color=black>Luminance:</style> Inactive:No Active:Yes (8)
<style color=black>Flammable:</style> No
<style color=black>Generated:</style> No
<style color=black>Renewable:</style> Yes
<style color=black>Stackable:</style> Yes (99)
<style color=black>Itemstring:</style> default:furnace default:furnace_active
<big>Usage</big>
The furnace menu can be accessed by <action name=using>using</action> the furnace.
The furnace has 3 <action name="invent ory">inventories</action>: An input slot, a fuel slot and 4 output slots. The fire in the furnace will automatically start when there is a smeltable item in the input slot and a fuel in the fuel slot.
As long as the fire is on, the furnace will smelt any smeltable item in the input slot, one by one, until it is empty. When the fire goes off, it will smelt the next item until there are no smeltable items and no fuel items left.
The current stage of cooking can be seen by <action name="pointing">pointing</action> the furnace or by viewing the furnace menu. In the furnace menu, the flame symbol roughly shows the remaining burning time. The arrow symbol shows the progress of the current smelting process.
<big>Renewing</big>
Furnaces can be crafted from e.g. <action name="default:cobblestone">cobblestone</action>, a renewable resource.
<big>Crafting</big>
Sorry no way to display crafting yet in formspec pages.
<big>Fuel</big>
See <action name="smelting">Smelting</action> for a list of furnace fuels.
<big>Recipes</big>
See the <action name="smelting">Smelting</action> page.
]=]

local fs2 = [=[
<global margin=10 halign=justify color=lightgrey>
<center><bigger>Formatted text in Formspecs</bigger>
<big>Formspec element</big></center>
You can now use formatted text in formspec using the <style font=mono>text</style> element:
<left><style font=mono color=lightblue>text[X,Y;W,H;name;markuptext]</style></left>

<style color=white>X,Y</style> and <style color=white>W,H</style>: Position and size, as for other usual formspec elements.
<style color=white>name</style>: Name used to send actions (click on actions).
<style color=white>markuptext</style>: Text formated using specific markup language.

<center><big>Markup language</big></center>
Markup language uses tags that look like HTML tags. Some tags can enclose text, they open with \<tagname> and close with \</tagname>. Tags can have attributes, in that case, attributes are in the openning tag in form of a key/value separated with equal signs. Attribute values should not be quotted.

<left><style font=mono color=lightblue>\<big>...\</big></style></left>
Draw text big.

<left><style font=mono color=lightblue>\<bigger>...\</bigger></style></left>
Draw text bigger.

<left><style font=mono color=lightblue>\<normal>...\</normal></style></left>
Draw text in normal (default) size.

<left><style font=mono color=lightblue>\<center>...\</center></style></left>
Center text.

<left><style font=mono color=lightblue>\<left>...\</left></style></left>
Left align text.

<left><style font=mono color=lightblue>\<right>...\</right></style></left>
Right align text.

<left><style font=mono color=lightblue>\<justify>...\</justify></style></left>
Justify text.

<left><style font=mono color=lightblue>\<action name=...>...\</action></style></left>
Make that text a clickable action.
<style color=white>name</style>: Name of the action (mandatory).
When clicked, the formspec is send to the server. The value of the text field will be "action:" concatenated to the action tag name. For example:
<style font=mono color=lightblue>text[0,0;3,1;mytext;\<action name=mytestaction>This is a test action\</action>]</style>
Will send <style font=mono>{ mytext="action:mytextaction" }</style> to <style font=mono>on_player_receive_fields</style>.


<left><style font=mono color=lightblue>\<img name=... float=... width=... height=...></style></left>
Draws an image. Image must be in game media.
<style color=white>name</style>: Name of the texture (mandatory).
<style color=white>float</style>: If present, makes the image floating (<style color=white>left</style> or <style color=white>right</style>).
<style color=white>width</style>: Force image width instead of taking texture width.
<style color=white>height</style>: Force image height instead of taking texture height.
If only width or height given, texture aspect is kept.

<left><style font=mono color=lightblue>\<item name=... float=... width=... height=... rotate=...></style></left>
Draws an item image.
<style color=white>name</style>: Item string of the item to draw (mandatory).
<style color=white>float</style>: If present, makes the image floating (<style color=white>left</style> or <style color=white>right</style>).
<style color=white>width</style>: Item image width.
<style color=white>height</style>: Item image height.
<style color=white>rotate</style>: Rotate item image if set to <style color=white>yes</style>.

<left><style font=mono color=lightblue>\<style color=... font=... size=...>...\</style></style></left>
Changes the style of the text.
<style color=white>color</style>: Text color. Given color is a colorspec (see lua_api.txt).
<style color=white>size</style>: Text size.
<style color=white>font</style>: Text font (<style color=white>mono</style> or <style color=white>normal</style>).

<left><style font=mono color=lightblue>\<global margin=... color=... actioncolor=... hovercolor=... size=... font=... haling=...></style></left>
Sets global style.
<style color=white>margin</style>: Page margins in pixel.
<style color=white>color</style>: Default text color. Given color is a colorspec (see lua_api.txt).
<style color=white>actioncolor</style>: Color of \<action> tags.
<style color=white>hovercolor</style>: Color of \<action> tags when mouse is over.
<style color=white>size</style>: Default text font size.
<style color=white>font</style>: Default text font (<style color=white>mono</style> or <style color=white>normal</style>).
<style color=white>halign</style>: Default text horizontal alignment (<style color=white>left</style>, <style color=white>right</style>, <style color=white>center</style>, <style color=white>justify</style>).
This tag needs to be placed only once as it changes the global settings of the text. Anyway, if several tags are placed, each changed will be made in the order tags appear.
]=]

-- #9548
local fs3 = [[
size[10,10]hypertext[0.2,1;10,9;test;
		AA<center>BB</center>CC
		<center>DD
		</center>EE
		<center>
		FF
		</center>
		<center></center>
		GG

		HH]
]]

minetest.register_chatcommand("e", {
	func = function(name)
		local fs = "formspec_version[2]" ..
				"size[11,10]" ..
				"hypertext[1,1;9,8;bla;" .. minetest.formspec_escape(fs1) .. "]"

		--minetest.show_formspec(name, "", fs)
		minetest.show_formspec(name, "", fs3)
	end
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	print(dump(fields))
	if fields.quit then return end
	local name = player:get_player_name()

if not fields.bla then return end
	if fields.bla:find("using") then
		local fs = "formspec_version[2]" ..
				"size[11,10]" ..
				"hypertext[1,1;9,8;bla;" .. minetest.formspec_escape(fs2) .. "]"

		minetest.show_formspec(name, "", fs)
	end
end)