import rawget from _G

threshold = 75
thresholdType = "percentage"
hookName = "CFCDynamicLimits_LowerLightsLamps"

description = {
    "At 75% server capacity, lights and lamp are disabled"
}

isInEffect = false

hook.Add "InitPostEntity", "CFCDynamicLimits_WrapLightsLamps", ->
    -- Gmod Lights
    with scripted_ents.GetStored("gmod_light").t
        .DynamicLimits_OldSetOn = .SetOn
        .SetOn = (on) =>
            return if isInEffect and on
            @DynamicLimits_OldSetOn on

    -- Gmod Lamps
    with scripted_ents.GetStored("gmod_lamp").t
        .DynamicLimits_OldSetOn = .SetOn
        .SetOn = (on) =>
            return if isInEffect and on
            @DynamicLimits_OldSetOn on

    -- Wire Lamps
    with scripted_ents.GetStored("gmod_wire_lamp").t
        .DynamicLimits_OldSetOn = .SetOn
        .SetOn = (on) =>
            return if isInEffect and on
            @DynamicLimits_OldSetOn on

    -- Wire Lights
    with scripted_ents.GetStored("gmod_wire_light").t
        .DynamicLimits_OldSetR = .SetR
        .DynamicLimits_OldSetG = .SetG
        .DynamicLimits_OldSetB = .SetB

        .SetR = (r) =>
            return if isInEffect and r > 0
            @DynamicLimits_OldSetR r

        .SetG = (g) =>
            return if isInEffect and g > 0
            @DynamicLimits_OldSetG g

        .SetB = (b) =>
            return if isInEffect and b > 0
            @DynamicLimits_OldSetB b

on = () ->
    isInEffect = true
    allEnts = ents.GetAll!
    entsCount = #allEnts

    for i = 1, entsCount do
        with ent = rawget allEnts, i
            entClass = \GetClass!

            switch entClass
                when "gmod_light"
                    \SetOn false
                when "gmod_lamp"
                    \SetOn false
                when "gmod_wire_lamp"
                    \SetOn false
                when "gmod_wire_light"
                    \SetR 0
                    \SetG 0
                    \SetB 0

off = () ->
    isInEffect = false

CFCDynamicLimits.Action "Disable-Lights-Lamps", on, off, threshold, description, thresholdType
