CFCDynamicLimits = {}
CFCDynamicLimits.Modules = {}

if CLIENT then
    include( "cfc_dynamic_limits/cl_chat.lua" )
end

if SERVER then
    AddCSLuaFile( "cfc_dynamic_limits/cl_chat.lua" )
    AddCSLuaFile( "cfc_dynamic_limits/sh_modules.lua" )

    include( "cfc_dynamic_limits/sv_checkup.lua" )
end

include( "cfc_dynamic_limits/sh_modules.lua" )
