local threshold = 75
local thresholdType = "percentage"

local description = {
    "At 75% server capacity, the following values are changed:",
    "    pac_sv_draw_distance: 8000 -> 1000"
}

local function on()
    RunConsoleCommand( "pac_sv_draw_distance", 1000 )
end

local function off()
    RunConsoleCommand( "pac_sv_draw_distance", 8000 )
end

CFCDynamicLimits.Action( "Lower-PAC-Render-Distance", on, off, threshold, description, thresholdType )
