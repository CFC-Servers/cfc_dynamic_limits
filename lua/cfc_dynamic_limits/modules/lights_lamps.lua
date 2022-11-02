local rawget = rawget

local threshold = 75
local thresholdType = "percentage"
local description = { "At 75% server capacity, lights and lamp are disabled" }

local isInEffect = false

local trackedEnts = {
    gmod_light = true,
    gmod_lamp = true,
    gmod_wire_light = true,
    gmod_wire_lamp = true
}

local function wrapSetOn( ent )
    ent.DynamicLimits_OldSetOn = ent.SetOn

    function ent:SetOn( on )
        if isInEffect and on then return end
        self:DynamicLimits_OldSetOn( on )
    end
end

local function wrapWireLight( light )
    light.DynamicLimits_OldSetR = light.SetR
    light.DynamicLimits_OldSetG = light.SetG
    light.DynamicLimits_OldSetB = light.SetB

    function light:SetR( r )
        if isInEffect and r > 0 then return end
        return self:DynamicLimits_OldSetR( r )
    end

    function light:SetG( g )
        if isInEffect and g > 0 then return end
        return self:DynamicLimits_OldSetG( g )
    end

    function light:SetB( b )
        if isInEffect and b > 0 then return end
        return self:DynamicLimits_OldSetB( b )
    end
end

hook.Add( "OnEntityCreated", "DynamicLimits_WrapLightsLamps", function( ent )
    if not rawget( trackedEnts, ent:GetClass() ) then return end

    if ent.SetOn then
        wrapSetOn( ent )
    end

    if ent.SetR then
        wrapWireLight( ent )
    end
end )

local function on()
    isInEffect = true
    local allEnts = ents.GetAll()
    local entsCount = #allEnts

    for i = 1, entsCount do
        local ent = rawget( allEnts, i )
        local entClass = ent:GetClass()

        if entClass == "gmod_light" then
            ent:SetOn( false )
        end

        if entClass == "gmod_lamp" then
            ent:SetOn( false )
        end

        if entClass == "gmod_wire_lamp" then
            ent:SetOn( false )
        end

        if entClass == "gmod_wire_light" then
            ent:SetR( 0 )
            ent:SetG( 0 )
            ent:SetB( 0 )
        end
    end
end

local function off()
    isInEffect = false
end

CFCDynamicLimits.Action( "Disable-Lights-Lamps", on, off, threshold, description, thresholdType )
