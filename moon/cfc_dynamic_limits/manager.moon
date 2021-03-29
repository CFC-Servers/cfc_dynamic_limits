AddCSLuaFile!

export CFCDynamicLimits

CFCDynamicLimits.Manager = {
    onPlayerJoin: () =>
        newCount = #player.GetAll!

        for name, action in pairs CFCDynamicLimits.Actions
            action\enable! if newCount == action.threshold

    onPlayerLeave: () =>
        newCount = #player.GetAll!

        for name, action in pairs CFCDynamicLimits.Actions
            action\disable! if newCount == action.threshold - 1
}

hook.Add "PlayerInitialSpawn", "CFCDynamicLimits_PlayerJoin", () ->
    CFCDynamicLimits.Manager\onPlayerJoin!

hook.Add "PlayerDisconnected", "CFCDynamicLimits_PlayerDisconnected", () ->
    CFCDynamicLimits.Manage\onPlayerLeave!
