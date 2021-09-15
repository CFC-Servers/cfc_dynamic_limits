AddCSLuaFile!
require "logger"

export CFCDynamicLimits = {}
CFCDynamicLimits.Logger = Logger "CFC DynamicLimits"

include "sh_action.lua"

if SERVER
    include "sv_manager.lua"
    AddCSLuaFile "cl_describer.lua"

MODULES_PATH = "cfc_dynamic_limits/modules"

modules = file.Find "#{MODULES_PATH}/*.lua", "LUA"
for limitModule in *modules
    path = "#{MODULES_PATH}/#{limitModule}"

    AddCSLuaFile path
    include path

if CLIENT
    include "cl_describer.lua"

-- TODO: Allow some way for modules to react to the current player count instead of on/off
