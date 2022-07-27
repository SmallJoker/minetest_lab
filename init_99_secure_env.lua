print(string.char)

local ie = lab.ie
		print(ie.string.char)
core.register_chatcommand("test", {
	func = function()
		core.chat_send_all('string = ' .. tostring(string))
		core.chat_send_all('string metatable = ' .. tostring(getmetatable("").__index))
		core.chat_send_all('ie.string = ' .. tostring(ie.string))
		string.asdf = 1
		assert(ie.string.asdf == nil)
		core.chat_send_all('table = ' .. dump(table))
		core.chat_send_all('ie.table = ' .. dump(ie.table))
		return true
	end,
})
