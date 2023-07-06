local threshold = 75
local thresholdType = "percentage"
local hookName = "CFCDynamicLimits_DisableRagdolls"
local description = {
    "At 75% server capacity, spawning ragdolls is disabled"
}

local function on()
    hook.Add( "PlayerSpawnRagdoll", hookName, function( ply )
        if ply:IsAdmin() then return end

        ply:ChatPrint( "Ragdolls are disabled when the server is at 75% capacity" )
        return false
    end )
end

local function off()
    hook.Remove( "PlayerSpawnRagdoll", hookName )
end

CFCDynamicLimits.Action( "Disable-Ragdolls", on, off, threshold, description, thresholdType )
