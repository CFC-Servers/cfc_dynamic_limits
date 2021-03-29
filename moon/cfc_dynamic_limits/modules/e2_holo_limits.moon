do
    threshold = 75
    thresholdType = "percentage"

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
        RunConsoleCommand "wire_holograms_burst_amount", 250

    CFCDynamicLimits.Action "Lower-Holo-Limits", on, off, threshold, description, thresholdType

do
    threshold = 100
    thresholdType = "percentage"

    description = {
        "At 100% server capacity, the following values are changed:",
        "wire_holograms_spawn_amount: 50 -> 25",
        "wire_holograms_burst_amount: 50 -> 30"
    }

    on = () ->
        RunConsoleCommand "wire_holograms_spawn_amount", 25
        RunConsoleCommand "wire_holograms_burst_amount", 30

    off = () ->
        RunConsoleCommand "wire_holograms_spawn_amount", 50
        RunConsoleCommand "wire_holograms_burst_amount", 50

    CFCDynamicLimits.Action "Lower-Holo-Limits2", on, off, threshold, description, thresholdType
