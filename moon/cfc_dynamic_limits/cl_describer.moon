import Split, StartWith, lower from string
import Actions from CFCDynamicLimits

RED: Color 255, 0, 0
YELLOW: Color 255, 255, 0
GREEN: Color 0, 255, 0

actionDescriptions = a.name, a.description for a in *Actions

describeAction = (name) ->
    chat.AddText GREEN, "Rule definition (#{name}):\n"

    description = actionDescriptions[name]

    if not description
        chat.AddText RED, "No Action found with that name\n"
        return

    for line in *description
        chat.AddText YELLOW, line, "\n\n"

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
