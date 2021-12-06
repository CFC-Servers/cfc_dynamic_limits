import floor from math

threshold = 75
thresholdType = "percentage"
hookName = "CFCDynamicLimits_LowerLightsLamps"

description = {
    "At 75% server capacity, lights and lamp are disabled"
}

cvars = {
    sbox_maxwire_lamps: {},
    sbox_maxwire_lights: {},
    sbox_maxlamps: {},
    lights: {}
}

hook.Add "Initialize", "CFCDynamicLimits_SetLightsLampsDefaults", ->
    for name, data in pairs cvars
        data.cvar = GetConVar name
        data.default = data.cvar\GetInt!

on = () ->
    for _, data in pairs cvars
        data.cvar\SetInt 0

off = () ->
    for _, data in pairs cvars
        data.cvar\SetInt data.default

CFCDynamicLimits.Action "Disable-Lights-Lamps", on, off, threshold, description, thresholdType
