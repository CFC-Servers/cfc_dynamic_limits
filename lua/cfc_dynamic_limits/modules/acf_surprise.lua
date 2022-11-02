local threshold = 16
local thresholdType = "number"
local description = { "At 16 players, ACF Cannons are disabled" }

local on = function()
    GetConVar( "acf_surprise" ):SetBool( true )
end

local off = function()
    GetConVar( "acf_surprise" ):SetBool( false )
end

CFCDynamicLimits.Action( "Disable-ACF", on, off, threshold, description, thresholdType )
