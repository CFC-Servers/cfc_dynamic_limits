local RED = Color( 230, 75, 75 )
local YELLOW = Color( 230, 230, 75 )
local GREEN = Color( 75, 230, 75 )

local actionDescriptions = {}
for _, action in ipairs( CFCDynamicLimits.Actions ) do
    actionDescriptions[action.name] = action.description
end

local function describeAction( name )
    MsgC( GREEN, name .. ":\n" )

    local description = actionDescriptions[name]

    if not description then
        MsgC( RED, "No action with that name exists!\n" )
        return
    end

    MsgC( "\n" )

    for _, line in ipairs( description ) do
        MsgC( YELLOW, line .. "\n" )
    end

    MsgC( "\n" )
end

hook.Add( "OnPlayerChat", "CFCDynamicLimits_DescribeAction", function( ply, text )
    if ply ~= LocalPlayer() then return end
    if not string.StartWith( text, "!dynlimits" ) then return end

    local actionName = string.Split( text, " " )[2]

    chat.AddText( GREEN, "[CFC Dynamic Limits] Details printed to your console!" )
    if not actionName then
        for name, _ in pairs( actionDescriptions ) do
            describeAction( name )
        end
    else
        describeAction( actionName )
    end

end )
