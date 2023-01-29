import Split, StartWith, lower from string
import Actions from CFCDynamicLimits

RED = Color 230, 75, 75
YELLOW = Color 230, 230, 75
GREEN = Color 75, 230, 75

actionDescriptions = {a.name, a.description for a in *Actions}

describeAction = (name) ->
    MsgC GREEN, "#{name}:\n"

    description = actionDescriptions[name]

    if not description
        MsgC RED, "No Action found with that name\n"
        return

    MsgC "\n"

    for line in *description
        MsgC YELLOW, line, "\n"

    MsgC "\n"


hook.Add "OnPlayerChat", "CFCDynamicLimits_DescribeAction", ( ply, text ) ->
    return unless ply == LocalPlayer!
    return unless StartWith text, "!dynlimits"
    actionName = Split(text, " ")[2]

    chat.AddText GREEN, "[Dynamic Limits] Details printed to your console!"
    if not actionName
        for name, description in pairs actionDescriptions
            describeAction name
    else
        describeAction lower actionName

    return true
