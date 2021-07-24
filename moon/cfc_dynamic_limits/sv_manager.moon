import pairs from _G
export CFCDynamicLimits

class CFCDynamicLimitsManager
    onPlayerJoin: () ->
        newCount = player.GetCount!

        for name, action in pairs CFCDynamicLimits.Actions
            action\enable! if newCount == action.threshold

    onPlayerLeave: () ->
        newCount = player.GetCount!

        for name, action in pairs CFCDynamicLimits.Actions
            action\disable! if newCount == action.threshold - 1

hook.Add "PlayerInitialSpawn", "CFCDynamicLimits_PlayerJoin", () ->
    CFCDynamicLimits.Manager.onPlayerJoin!
    return nil

hook.Add "PlayerDisconnected", "CFCDynamicLimits_PlayerDisconnected", () ->
    CFCDynamicLimits.Manager.onPlayerLeave!
    return nil

CFCDynamicLimits.Manager = CFCDynamicLimitsManager!
