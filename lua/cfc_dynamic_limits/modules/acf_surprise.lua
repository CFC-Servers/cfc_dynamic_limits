local threshold = 25
local thresholdType = "number"
local hookName = "CFCDynamicLimits_DisableACFCannons"
local description = {
  "At 25 players, ACF Cannons are disabled"
}
local on
on = function()
  return GetConVar("acf_surprise"):SetBool(true)
end
local off
off = function()
  return GetConVar("acf_surprise"):SetBool(false)
end
return CFCDynamicLimits.Action("Disable-ACF", on, off, threshold, description, thresholdType)
