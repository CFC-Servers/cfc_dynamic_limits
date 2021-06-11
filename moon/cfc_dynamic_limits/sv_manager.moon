import lower from string
import pairs from _G
export CFCDynamicLimits

DESCRIBE_ACTIONS_NET = "CFCDynamicLimits_DescribeActions"
util.AddNetworkString DESCRIBE_ACTIONS_NET

class CFCDynamicLimitsManager
    _actionDescriptions = {}

    cacheActionDescriptions: () ->
        for name, action in pairs CFCDynamicLimits.Actions
            _actionDescriptions[lower name] = action.description

    onPlayerJoin: () ->
        newCount = player.GetCount!

        for name, action in pairs CFCDynamicLimits.Actions
            action\enable! if newCount == action.threshold

    onPlayerLeave: () ->
        newCount = player.GetCount!

        for name, action in pairs CFCDynamicLimits.Actions
            action\disable! if newCount == action.threshold - 1

    sendActionDescriptions: (ply) ->
        net.Start DESCRIBE_ACTIONS_NET
        net.WriteTable _actionDescriptions
        net.Send ply

hook.Add "InitPostEntity", "CFCDynamicLimits_CacheActionDescriptions", () ->
    CFCDynamicLimits.Manager.cacheActionDescriptions!
    return nil

hook.Add "PlayerAuthed", "CFCDynamicLimits_SendActionDescriptions", (ply) ->
    CFCDynamicLimits.Manager.sendActionDescriptions ply
    return nil

hook.Add "PlayerInitialSpawn", "CFCDynamicLimits_PlayerJoin", () ->
    CFCDynamicLimits.Manager.onPlayerJoin!
    return nil

hook.Add "PlayerDisconnected", "CFCDynamicLimits_PlayerDisconnected", () ->
    CFCDynamicLimits.Manage.onPlayerLeave!
    return nil

CFCDynamicLimits.Manager = CFCDynamicLimitsManager!
