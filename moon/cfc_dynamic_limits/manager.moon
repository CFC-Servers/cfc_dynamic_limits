import StartWith, lower from string

export CFCDynamicLimits

CFCDynamicLimits.Manager = {
    onPlayerJoin: () ->
        newCount = player.GetCount!

        for name, action in pairs CFCDynamicLimits.Actions
            action\enable! if newCount == action.threshold

    onPlayerLeave: () ->
        newCount = player.GetCount!

        for name, action in pairs CFCDynamicLimits.Actions
            action\disable! if newCount == action.threshold - 1

    onRequestDescribe: (ply, name) ->
        description = CFCDynamicLimits.Actions[lower name]

        if not description
            ply\ChatPrint "No Action found with that name"
            return

        for line in *description
            ply\ChatPrint line

        -- TODO:
        --net.Start "CFCDynamicLimits_DescribeAction"
        --net.WriteTable description
        --net.Send ply
}

hook.Add "PlayerInitialSpawn", "CFCDynamicLimits_PlayerJoin", () ->
    CFCDynamicLimits.Manager.onPlayerJoin!

hook.Add "PlayerDisconnected", "CFCDynamicLimits_PlayerDisconnected", () ->
    CFCDynamicLimits.Manage.onPlayerLeave!

hook.Add "PlayerSay", "CFCDynamicLimits_ChatCommands", (ply, text) ->
    return unless StartWith text, "!describe"
    actionName = Split(text, " ")[2]

    CFCDynamicLimits.Manager.onRequestDescribe ply, actionName
