core.register_chatcommand("fs", {
	func = function(name, param)
		local player = core.get_player_by_name(name)
		if not player then return end -- ncurses

		if core.get_player_information(name).protocol_version < (core.protocol_versions["5.13.0"] or 0) then
			return false, "Not supported by client; formspec inputs are not sent to the server"
		end

		local fs = player:get_inventory_formspec()
		core.show_formspec(name, "", "size[8,8]button[4,4;5,1;x;I do nothing]")

		assert(fs == player:get_inventory_formspec(), "formspecs must still match")

		core.after(2, function()
			-- Force update to the regular inventory formspec
			core.chat_send_player(name, "*** PREVIOUS FORMSPEC RESTORED ***")
			player:set_inventory_formspec(fs)
		end)

		core.after(5, function()
			-- Force close
			core.chat_send_player(name, "*** FORCE CLOSE FORMSPEC TEST ***")
			core.show_formspec(name, "", "")
		end)
		return true
	end
})
