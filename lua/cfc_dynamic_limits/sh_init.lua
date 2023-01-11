AddCSLuaFile()
require("logger")
CFCDynamicLimits = { }
CFCDynamicLimits.Logger = Logger("CFC DynamicLimits")
include("sh_action.lua")
if SERVER then
  include("sv_manager.lua")
  AddCSLuaFile("cl_describer.lua")
end
local MODULES_PATH = "cfc_dynamic_limits/modules"
local modules = file.Find(tostring(MODULES_PATH) .. "/*.lua", "LUA")
for _index_0 = 1, #modules do
  local limitModule = modules[_index_0]
  local path = tostring(MODULES_PATH) .. "/" .. tostring(limitModule)
  AddCSLuaFile(path)
  include(path)
end
if CLIENT then
  return include("cl_describer.lua")
end
