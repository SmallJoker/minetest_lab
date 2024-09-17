local http_api = lab.http

local testn = 0
local function dotest()
	if testn >= 6 then
		print("done")
		return
	end
	testn = testn + 1
	local my_n = testn
	print("begin " .. my_n)
	http_api.fetch({
		url = "https://httpbin.org/delay/2",
	}, function(res)
		print("end " .. my_n .. " " .. tostring(res.succeeded))
	end)
	core.after(1 + testn/4, dotest)
end

core.after(3, dotest)
