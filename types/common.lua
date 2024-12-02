---@meta

---@class SharedCommon
---@field resourceName string The current resourceName
---@field isServer boolean The side running in server
---@field protected version string The version of the script
---@field info (fun(...: string[]))
Shared = {}

---@class GlobalSettings
---@field framework string The name of the framework used by server
