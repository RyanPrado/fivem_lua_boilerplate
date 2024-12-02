if not lib then return end

---@class SharedServer
local Shared = Shared
local success, result = pcall(lib.load, ('static.bridge.%s.server'):format(Shared.framework))

if not success then
	lib = nil
	error(result, 0)
end
