minetest.register_chatcommand("raycast", {
	func = function()
		for _, sign in ipairs({-1, 1}) do
			for x = 32760, 32770 do
			for y = 32760, 32770 do
			for z = 32760, 32770 do
				local pos1 = vector.new(sign*x, sign*y, sign*z)
				local pos2 = vector.add(pos1, vector.new(sign*50, 0, sign*100))
				core.raycast(pos1, pos2, true, true):next()
			end
			end
			end
		end
		core.chat_send_all("You should see this message.")
	end
})
