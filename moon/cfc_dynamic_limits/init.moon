AddCSLuaFile!
require "cfclogger"

export CFCDynamicLimits = {}
CFCDynamicLimits.Logger = CFCLogger "CFC DynamicLimits"

include "manager.lua"
include "action.lua"
include "describer.lua"

modules = file.Find "cfc_dynamic_limits/modules/*.lua", "LUA"
for limitModule in *modules
    include "cfc_dynamic_limits/modules/#{limitModule}"

-- TODO: Allow some way for modules to react to the current player count instead of on/off
-- TODO: Figure out the server/client split - some modules might need to be shared. Will we need clientside-only modules/manager/actions?
