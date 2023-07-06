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

local function recheckLimits()
    local plyCount = player.GetCount()

    for _, mod in pairs( modules ) do
        ProtectedCall( function() checkModule( plyCount, mod ) end )
    end
end

hook.Add( "PlayerAuthed", "CFC_DynamicLimits", recheckLimits )
hook.Add( "PlayerDisconnected", "CFC_DynamicLimits", recheckLimits )
