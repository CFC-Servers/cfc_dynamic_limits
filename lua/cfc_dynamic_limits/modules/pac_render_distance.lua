local threshold = 75
local thresholdType = "percentage"
local description = {
  "At 75% server capacity, the following values are changed:",
  "    pac_sv_draw_distance: 8000 -> 1000"
}
local on
on = function()
  return RunConsoleCommand("pac_sv_draw_distance", 1000)
end
local off
off = function()
  return RunConsoleCommand("pac_sv_draw_distance", 8000)
end
return CFCDynamicLimits.Action("Lower-PAC-Render-Distance", on, off, threshold, description, thresholdType)
