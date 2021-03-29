-- 50%
threshold = 0.5
hookName = "CFCDynamicLimits_DisableRagdolls"

description = {
    "At 50% server capacity, spawning ragdolls is disabled"
}

on = () ->
    hook.Add "PlayerSpawnRagdoll", hookName, (ply) ->
        return if ply\IsAdmin!

        ply\ChatPrint "Ragdolls are disabled when the server is at half capacity"
        return false

off = () ->
    hook.Remove "PlayerSpawnRagdoll", hookName

CFCDynamicLimits.Action "Disable-Ragdolls", on, off, threshold, description
