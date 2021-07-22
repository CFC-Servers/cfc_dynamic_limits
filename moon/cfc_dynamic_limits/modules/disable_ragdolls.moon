threshold = 30
thresholdType = "number"
hookName = "CFCDynamicLimits_DisableRagdolls"

description = {
    "At 30 players, spawning ragdolls is disabled"
}

on = () ->
    hook.Add "PlayerSpawnRagdoll", hookName, (ply) ->
        return if ply\IsAdmin!

        ply\ChatPrint "Ragdolls are disabled when the server is at half capacity"
        return false

off = () ->
    hook.Remove "PlayerSpawnRagdoll", hookName

CFCDynamicLimits.Action "Disable-Ragdolls", on, off, threshold, description, thresholdType
