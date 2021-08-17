AddCSLuaFile!
require "logger"

export CFCDynamicLimits = {}
CFCDynamicLimits.Logger = Logger "CFC DynamicLimits"

include "cl_describer.lua"

return unless SERVER

include "sv_manager.lua"
include "sv_action.lua"

MODULES_PATH = "cfc_dynamic_limits/modules"

modules = file.Find "#{MODULES_PATH}/*.lua", "LUA"
for limitModule in *modules
    include "#{MODULES_PATH}/#{limitModule}"

-- TODO: Allow some way for modules to react to the current player count instead of on/off
-- TODO: Figure out the server/client split - some modules might need to be shared. Will we need clientside-only modules/manager/actions?
