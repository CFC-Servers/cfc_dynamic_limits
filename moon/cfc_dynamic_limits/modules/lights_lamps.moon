import floor from math

threshold = 75
thresholdType = "percentage"
hookName = "CFCDynamicLimits_LowerLightsLamps"

description = {
    "At 75% server capacity, lights and lamp names are halved"
}

modify = (mod) ->
    wire_lamps = GetConVar "sbox_maxwire_lamps"
    wire_lamps\SetInt floor wire_lamps\GetInt! * mod

    wire_lights = GetConVar "sbox_maxwire_lights"
    wire_lights\SetInt floor wire_lights\GetInt! * mod

    lamps = GetConVar "sbox_maxlamps"
    lamps\SetInt floor lights\GetInt! * mod

    lights = GetConVar "sbox_maxlights"
    lights\SetInt floor lamps\GetInt! * mod

on = () ->
    modify 0.5

off = () ->
    modify 2

CFCDynamicLimits.Action "Lower-Lights-Lamps", on, off, threshold, description, thresholdType
