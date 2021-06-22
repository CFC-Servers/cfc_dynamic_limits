AddCSLuaFile!
return unless CLIENT
import Split, StartWith, lower from string


local actionDescriptions
net.Receive "CFCDynamicLimits_DescribeAction", ->
    return if actionDescriptions

    print "[CFC_Dynamic_Limits] Received action descriptions"
    actionDescriptions = net.ReadTable!

COLORS =
    RED: Color 255, 0, 0
    YELLOW: Color 255, 255, 0
    GREEN: Color 0, 255, 0

describeAction = (name) ->
    chat.AddText COLORS.GREEN, "Rule definition (#{name}):\n"

    description = actionDescriptions[name]

    if not description
        chat.AddText COLORS.RED, "No Action found with that name\n"
        return

    for line in *description
        chat.AddText COLORS.YELLOW, line, "\n\n"

hook.Add "OnPlayerChat", "CFCDynamicLimits_DescribeAction", ( ply, text ) ->
    return unless StartWith text, "!describe"
    actionName = Split(text, " ")[2]
    actionName = lower actionName

    if actionName == "*"
        for name, description in pairs actionDescriptions
            describeAction name
    else
        describeAction actionName

    return true
