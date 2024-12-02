local function addDeferral(err)
	err = err:gsub('%^%d', '')
	AddEventHandler('playerConnecting', function(_, _, deferrals)
		deferrals.defer()
		deferrals.done(err)
	end)
end

---@class GlobalSettings
local config = lib.loadJson('static.settings')

---@class SharedCommon
Shared = {
	resourceName = GetCurrentResourceName(),
	isServer = IsDuplicityVersion(),
	framework = config.framework,
	version = '2.0.0',
}

---@diagnostic disable: undefined-field
function Shared.info(...) lib.print.info(string.strjoin(' ', ...)) end

if Shared.isServer then
	Server = {}
else
	Client = {}
end

local function spamError(err)
	if Shared.isServer then
		---@package
		---@diagnostic disable-next-line: inject-field
		Shared.ready = false
	end

	CreateThread(function()
		while true do
			Wait(10000)
			CreateThread(function() error(err, 0) end)
		end
	end)

	addDeferral(err)
	error(err, 0)
end

local success, msg = lib.checkDependency('oxmysql', '2.7.4')
if success then
	success, msg = lib.checkDependency('ox_lib', '3.25.0')
end
if not success then return spamError(msg) end

if lib.context == 'server' then return require('src.server') end

require('src.client')
