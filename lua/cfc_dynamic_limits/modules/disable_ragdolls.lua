local threshold = 75
local thresholdType = "percentage"
local hookName = "CFCDynamicLimits_DisableRagdolls"
local description = {
  "At 75% server capacity, spawning ragdolls is disabled"
}
local on
on = function()
  return hook.Add("PlayerSpawnRagdoll", hookName, function(ply)
    if ply:IsAdmin() then
      return 
    end
    ply:ChatPrint("Ragdolls are disabled when the server is at 75% capacity")
    return false
  end)
end
local off
off = function()
  return hook.Remove("PlayerSpawnRagdoll", hookName)
end
return CFCDynamicLimits.Action("Disable-Ragdolls", on, off, threshold, description, thresholdType)
