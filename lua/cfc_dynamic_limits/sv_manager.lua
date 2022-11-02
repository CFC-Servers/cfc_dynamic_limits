local Manager = {}

function Manager:OnPlayerJoin()
    local newCount = player.GetCount()

    for _, action in pairs( CFCDynamicLimits.Actions ) do
        if newCount == action.threshold then
            action:Enable()
        end
    end
end

function Manager:OnPlayerLeave()
    local newCount = player.GetCount()

    for _, action in pairs( CFCDynamicLimits.Actions ) do
        if newCount == action.threshold - 1 then
            action:Disable()
        end
    end
end

hook.Add( "PlayerInitialSpawn", "CFCDynamicLimits_CheckActions", function()
    Manager:OnPlayerJoin()
end )

hook.Add( "PlayerDisconnected", "CFCDynamicLimits_CheckActions", function()
    Manager:OnPlayerLeave()
end )

return Manager
