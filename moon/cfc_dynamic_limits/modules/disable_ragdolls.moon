-- 50%
threshold = 0.5
hookName = "CFCDynamicLimits_DisableRagdolls"

on = () ->
    hook.Add "PlayerSpawnRagdoll", hookName, (ply) ->
        ply\ChatPrint "Ragdolls are disabled when the server is at half capacity"
        return false

off = () ->
    hook.Remove "PlayerSpawnRagdoll", hookName

CFCDynamicLimits.Action "Disable Ragdolls", on, off, threshold
