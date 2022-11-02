AddCSLuaFile()

local Actions = {}
CFCDynamicLimits.Actions = Actions

local function parseThreshold( threshold )
    return math.Round( threshold / 100 ) * game.MaxPlayers()
end

local function alert( message )
    message = "[CFC Dynamic Limits] " .. message
    for _, ply in ipairs( player.GetAll() ) do
        ply:ChatPrint( message )
    end
end

return function( name, on, off, threshold, description, thresholdType )
    if thresholdType == nil then thresholdType = "number" end

    assert( threshold > 0, "Threshold must be greater than 0" )

    if thresholdType == "percentage" then
        threshold = parseThreshold( threshold )
    end

    local action = {
        name = name,
        on = on,
        off = off,
        threshold = threshold,
        description = description
    }

    function action:Enable()
        alert( self.name .. " has been enabled" )
        self.on()
    end

    function action:Disable()
        alert( self.name .. " has been disabled" )
        self.off()
    end

    table.insert( Actions, action )

    return action
end
