if not lib then return end

require('src.modules.bridge.server')

---@class SharedServer
local Shared = Shared
Shared.ready = false
