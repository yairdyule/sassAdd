local handle = io.popen("ls")
local result = handle:read("*a")
handle:close()
