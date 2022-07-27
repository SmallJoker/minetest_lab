local min_ms = 999999
local max_ms = 0
local time_s = 0

minetest.register_globalstep(function(dtime)
	time_s = time_s + dtime
	dtime = dtime * 1000

	min_ms = math.min(min_ms, dtime)
	max_ms = math.max(max_ms, dtime)

	print(("time_s=% 3.0f, min_ms=% 3.1f, max_ms=% 3.1f, dtime_ms=% 3.1f")
		:format(time_s, min_ms, max_ms, dtime))
end)

--[=[
time_s=  2, min_ms= 80.0, max_ms= 81.0, dtime_ms= 80.0
time_s=  3, min_ms= 80.0, max_ms= 81.0, dtime_ms= 80.0
time_s=  3, min_ms= 80.0, max_ms= 81.0, dtime_ms= 80.0
time_s=  3, min_ms= 80.0, max_ms= 81.0, dtime_ms= 80.0
2019-11-14 19:44:34: ACTION[Server]: Krock [127.0.0.1] joins game. 
2019-11-14 19:44:34: ACTION[Server]: Krock joins game. List of players: Krock
time_s=  3, min_ms= 80.0, max_ms= 92.0, dtime_ms= 92.0
time_s=  3, min_ms= 80.0, max_ms= 92.0, dtime_ms= 80.0
time_s=  3, min_ms= 80.0, max_ms= 92.0, dtime_ms= 80.0
time_s=  3, min_ms= 80.0, max_ms= 92.0, dtime_ms= 80.0




time_s=  3, min_ms= 0.0, max_ms= 80.0, dtime_ms= 80.0
time_s=  3, min_ms= 0.0, max_ms= 80.0, dtime_ms= 80.0
time_s=  3, min_ms= 0.0, max_ms= 80.0, dtime_ms= 80.0
time_s=  3, min_ms= 0.0, max_ms= 80.0, dtime_ms= 80.0
2019-11-14 19:44:03: ACTION[Server]: Krock [127.0.0.1] joins game. 
2019-11-14 19:44:03: ACTION[Server]: Krock joins game. List of players: Krock
time_s=  4, min_ms= 0.0, max_ms= 80.0, dtime_ms= 80.0
time_s=  4, min_ms= 0.0, max_ms= 80.0, dtime_ms= 80.0
time_s=  4, min_ms= 0.0, max_ms= 80.0, dtime_ms= 80.0
time_s=  4, min_ms= 0.0, max_ms= 80.0, dtime_ms= 80.0



]=]