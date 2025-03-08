if not isdedicatedserver then return end

local path = "client/servercomms.txt"

local file = io.openlocal(path, "r")
if not file then
	file = io.openlocal(path, "w+")
end

addHook("ThinkFrame", function()
	if leveltime % TICRATE then return end

	local file = io.openlocal(path, "r")

	if file:read() == "quit" then
		io.openlocal(path, "w+")
		print("SRB2: Quit command received.")
		COM_BufInsertText(server, "quit")
	end
end)
