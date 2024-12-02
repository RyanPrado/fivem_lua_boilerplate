if not lib then return end

---@class SharedClient
local Shared = Shared
local success, result = pcall(lib.load, ('static.bridge.%s.client'):format(Shared.framework))

if not success then
	lib.print.error(result)
	lib = nil
	return
end
