local threshold = 28
local thresholdType = "number"
local description = {
    "At 28 players, ACF weapons are disabled"
}

local function on()
    if ACF_Surprise then
        ACF_Surprise.Enable()
    end
end

local function off()
    if ACF_Surprise then
        ACF_Surprise.Disable()
    end
end

CFCDynamicLimits.Action( "ACF", on, off, threshold, description, thresholdType, true )
