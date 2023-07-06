function CFCDynamicLimits.Action( name, onFunc, offFunc, threshold, descriptionTbl, thresholdType )
    if threshold <= 0 then
        error( "threshold must be greater than 0" )
    end

    if thresholdType == "percentage" then
        threshold = math.Round( threshold / 100 * game.MaxPlayers() )
    end

    if SERVER then
        CFCDynamicLimits.Modules[name] = {
            name = name,
            on = onFunc,
            off = offFunc,
            threshold = threshold,
            enabled = false
        }
    end

    if CLIENT then
        CFCDynamicLimits.Modules[name] = {
            name = name,
            threshold = threshold,
            description = descriptionTbl,
            enabled = false
        }
    end
end

local moduleFiles = file.Find( "cfc_dynamic_limits/modules/*.lua", "LUA" )
for _, fil in pairs( moduleFiles ) do
    if SERVER then
        AddCSLuaFile( "cfc_dynamic_limits/modules/" .. fil )
    end
    include( "cfc_dynamic_limits/modules/" .. fil )
end
