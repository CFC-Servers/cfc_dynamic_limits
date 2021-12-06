threshold = 75
thresholdType = "percentage"
hookName = "CFCDynamicLimits_DisableRagdolls"

description = {
    "At 75% server capacity, spawning ragdolls is disabled"
}

on = () ->
    hook.Add "PlayerSpawnRagdoll", hookName, (ply) ->
        return if ply\IsAdmin!

        ply\ChatPrint "Ragdolls are disabled when the server is at 75% capacity"
        return false

off = () ->
    hook.Remove "PlayerSpawnRagdoll", hookName

CFCDynamicLimits.Action "Disable-Ragdolls", on, off, threshold, description, thresholdType
