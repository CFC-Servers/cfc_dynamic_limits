AddCSLuaFile!
require "cfclogger"

export CFCDynamicLimits = {}
CFCDynamicLimits.Logger = CFCLogger "CFC DynamicLimits"

include "manager.lua"
include "action.lua"

modules = file.Find "cfc_dynamic_limits/modules/*.lua", "LUA"
for limitModule in *modules
    include "cfc_dynamic_limits/modules/#{limitModule}"

-- TODO: Allow some way for modules to react to the current player count instead of on/off
