threshold = 75
thresholdType = "percentage"

description = {
    "At 75% server capacity, the following values are changed:",
    "    pac_sv_draw_distance: 8000 -> 1000"
}

on = () ->
    RunConsoleCommand "pac_sv_draw_distance", 1000

off = () ->
    RunConsoleCommand "pac_sv_draw_distance", 8000

CFCDynamicLimits.Action "Lower-PAC-Render-Distance", on, off, threshold, description, thresholdType
