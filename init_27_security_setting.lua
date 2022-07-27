local is_secure = core.settings:get_bool("secure.enable_security")
core.settings:set_bool(".\nsecure.enable_security", not is_secure)
core.log("warning", "Set security to " .. tostring(not is_secure):upper())

--[[
Old output:

.
secure.enable_security = false
.
secure.enable_security = false
.
secure.enable_security = false
.
secure.enable_security = true
]]
