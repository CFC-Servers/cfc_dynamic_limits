AddCSLuaFile!
return unless CLIENT
import StartWith, lower from string

local actionDescriptions
net.Receive "CFCDynamicLimits_DescribeAction", ->
    return if actionDescriptions
    actionDescriptions = net.ReadTable!

COLORS =
    RED: Color 255, 0, 0
    YELLOW: Color 255, 255, 0
    GREEN: Color 0, 255, 0

hook.Add "OnPlayerChat", "CFCDynamicLimits_DescribeAction", ( ply, text ) ->
    return unless StartWith text, "!describe"
    actionName = Split(text, " ")[2]

    description = actionDescriptions[lower actionName]

    if not description
        chat.AddText COLORS.RED, "No Action found with that name\n"
        return true

    chat.AddText COLORS.GREEN, "Rule definition:\n"

    for line in *description
        chat.AddText COLORS.YELLOW, line, "\n"

    return true
