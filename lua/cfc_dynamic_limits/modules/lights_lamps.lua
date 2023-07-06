local rawget = rawget

local threshold = 75
local thresholdType = "percentage"
local description = {
    "At 75% server capacity, lights and lamp are disabled"
}

local isInEffect = false

local trackedEnts = {
    gmod_light = true,
    gmod_lamp = true,
    gmod_wire_light = true,
    gmod_wire_lamp = true
}

local function wrapSetOn( ent )
    ent.DynamicLimits_OldSetOn = ent.SetOn
    ent.SetOn = function( self, on )
        if isInEffect and on then return end
        self:DynamicLimits_OldSetOn( on )
    end
end

local function wrapWireLight( light )
    light.DynamicLimits_OldSetR = light.SetR
    light.DynamicLimits_OldSetG = light.SetG
    light.DynamicLimits_OldSetB = light.SetB

    light.SetR = function( self, r )
        if isInEffect and r > 0 then return end
        self:DynamicLimits_OldSetR( r )
    end

    light.SetG = function( self, g )
        if isInEffect and g > 0 then return end
        self:DynamicLimits_OldSetG( g )
    end

    light.SetB = function( self, b )
        if isInEffect and b > 0 then return end
        self:DynamicLimits_OldSetB( b )
    end
end

hook.Add( "OnEntityCreated", "DynamicLimits_WrapLightsLamps", function( ent )
    if not trackedEnts[ent:GetClass()] then return end

    if ent.SetOn then
        wrapSetOn( ent )
    elseif ent.SetR then
        wrapWireLight( ent )
    end

    return nil
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
        elseif entClass == "gmod_lamp" then
            ent:SetOn( false )
        elseif entClass == "gmod_wire_lamp" then
            ent:SetOn( false )
        elseif entClass == "gmod_wire_light" then
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
