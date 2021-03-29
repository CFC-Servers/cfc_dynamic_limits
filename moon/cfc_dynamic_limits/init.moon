AddCSLuaFile!
require "cfclogger"

export CFCDynamicLimits = {}
CFCDynamicLimits.Logger = CFCLogger "CFC DynamicLimits"

include "manager.lua"
include "action.lua"

modules = file.Find "cfc_dynamic_limits/modules/*.lua", "LUA"
for limitModule in *modules
    include "cfc_dynamic_limits/modules/#{limitModule}"
