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
    local result = hook.Run( "CFC_DynamicLimits_ShouldCountPlayer", ply )
    if result == false then
        return false
    end

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

        SetGlobal2Int( "CFC_DynamicLimits_PlayersCounted", plyCount )

        for _, mod in pairs( modules ) do
            checkModule( plyCount, mod )
        end
    end )
end

hook.Add( "PlayerInitialSpawn", "CFC_DynamicLimits", recheckLimits )
hook.Add( "PlayerDisconnected", "CFC_DynamicLimits", recheckLimits )

-- Custom hooks
hook.Add( "CFC_AntiAFK_StatusChange", "CFC_DynamicLimits", recheckLimits )
