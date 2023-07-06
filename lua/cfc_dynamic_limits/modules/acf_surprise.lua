local threshold = 25
local thresholdType = "number"
local description = {
    "At 25 players, ACF Cannons are disabled"
}

local function on()
    GetConVar( "acf_surprise" ):SetBool( true )
end

local function off()
    GetConVar( "acf_surprise" ):SetBool( false )
end

CFCDynamicLimits.Action( "Disable-ACF", on, off, threshold, description, thresholdType )
