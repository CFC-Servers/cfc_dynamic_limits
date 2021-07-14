import lower from string
import pairs from _G
export CFCDynamicLimits

DESCRIBE_ACTIONS_NET = "CFC_DynamicLimits_DescribeActions"
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

        ply.hasDescriptions = true

net.Receive DESCRIBE_ACTIONS_NET, (_, ply) ->
    return if ply.hasDescriptions
    CFCDynamicLimits.Manager.sendActionDescriptions ply

hook.Add "InitPostEntity", "CFC_DynamicLimits_CacheActionDescriptions", () ->
    CFCDynamicLimits.Manager.cacheActionDescriptions!
    return nil

hook.Add "PlayerInitialSpawn", "CFC_DynamicLimits_PlayerJoin", () ->
    CFCDynamicLimits.Manager.onPlayerJoin!
    return nil

hook.Add "PlayerDisconnected", "CFC_DynamicLimits_PlayerDisconnected", () ->
    CFCDynamicLimits.Manager.onPlayerLeave!
    return nil

CFCDynamicLimits.Manager = CFCDynamicLimitsManager!
