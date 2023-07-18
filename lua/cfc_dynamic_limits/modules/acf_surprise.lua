local threshold = 25
local thresholdType = "number"
local description = {
    "At 25 players, ACF Cannons are disabled"
}

local function on()
    local cvar = GetConVar( "acf_surprise" )
    if not cvar then return end
    cvar:SetBool( true )
end

local function off()
    local cvar = GetConVar( "acf_surprise" )
    if not cvar then return end
    cvar:SetBool( false )
end

CFCDynamicLimits.Action( "Disable ACF", on, off, threshold, description, thresholdType )
