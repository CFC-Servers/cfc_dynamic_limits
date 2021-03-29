-- 75%
threshold = 0.75

description = {
    "At 75% server capacity, the following values are changed:",
    "wire_holograms_max: 500 -> 200",
    "wire_holograms_spawn_amount: 100 -> 50",
    "wire_holograms_burst_amount: 250 -> 50"
}

on = () ->
    RunConsoleCommand "wire_holograms_max", 200
    RunConsoleCommand "wire_holograms_spawn_amount", 50
    RunConsoleCommand "wire_holograms_burst_amount", 50

off = () ->
    RunConsoleCommand "wire_holograms_max", 500
    RunConsoleCommand "wire_holograms_spawn_amount", 100
    RunConsoleCommand "wire_holograms_burst_amount" 250

CFCDynamicLimits.Action "Lower-Holo-Limits", on, off, threshold, description
