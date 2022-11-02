AddCSLuaFile()

CFCDynamicLimits = CFCDynamicLimits or {}

if file.Exists( "includes/modules/logger.lua", "LUA" ) then
    require( "logger" )
end

CFCDynamicLimits.Logger = Logger and Logger( "CFCDynamicLimits" ) or {
    log = print,
    warn = print,
    error = print,
    debug = print
}

if SERVER then
    include( "sv_manager.lua" )
    AddCSLuafile( "cl_describer.lua" )
end

local MODULES_PATH = "cfc_dynamic_limits/modules"
local modules = file.Find( MODULES_PATH .. "/*.lua", "LUA" )
for _, module in ipairs( modules ) do
    local path = MODULES_PATH .. "/" .. module

    AddCSLuaFile( path )
    include( path )
end

if CLIENT then
    include( "cl_describer.lua" )
end
