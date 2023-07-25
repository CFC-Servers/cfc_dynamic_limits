local modules = CFCDynamicLimits.Modules

util.AddNetworkString( "cfc_dynamiclimits_notify" )

local function enableModule( mod )
    mod.on()

    net.Start( "cfc_dynamiclimits_notify" )
        net.WriteString( mod.name )
        net.WriteBool( true )
    net.Broadcast()
end

local function disableModule( mod )
    mod.off()

    net.Start( "cfc_dynamiclimits_notify" )
        net.WriteString( mod.name )
        net.WriteBool( false )
    net.Broadcast()
end

local function checkModule( plyCount, mod )
    if plyCount >= mod.threshold then
        if not mod.enabled then
            enableModule( mod )
        end
    else
        if mod.enabled then
            disableModule( mod )
        end
    end
end

local function shouldCountPlayer( ply )
    if ply:GetNWBool( "CFC_AntiAFK_IsAFK" ) then return false end -- Anti-AFK

    return true
end

local function recheckLimits()
    timer.Simple( 0, function()
        local plyCount = 0
        for _, ply in ipairs( player.GetAll() ) do
            if shouldCountPlayer( ply ) then
                plyCount = plyCount + 1
            end
        end

        for _, mod in pairs( modules ) do
            checkModule( plyCount, mod )
        end
    end )
end

hook.Add( "PlayerInitialSpawn", "CFC_DynamicLimits", recheckLimits )
hook.Add( "PlayerDisconnected", "CFC_DynamicLimits", recheckLimits )

-- Custom hooks
hook.Add( "CFC_AntiAFK_SetAFK", "CFC_DynamicLimits", recheckLimits )
hook.Add( "CFC_AntiAFK_RemoveAFK", "CFC_DynamicLimits", recheckLimits )
