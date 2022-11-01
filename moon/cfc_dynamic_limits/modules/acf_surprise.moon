threshold = 16
thresholdType = "number"
hookName = "CFCDynamicLimits_DisableACFCannons"

description = {
    "At 16 players, ACF Cannons are disabled"
}

on = () -> GetConVar( "acf_surprise" )\SetBool true

off = () -> GetConVar( "acf_surprise" )\SetBool false

CFCDynamicLimits.Action "Disable-ACF", on, off, threshold, description, thresholdType
