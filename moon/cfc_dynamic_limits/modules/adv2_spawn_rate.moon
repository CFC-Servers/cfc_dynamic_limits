do
    threshold = 50
    thresholdType = "percentage"

    description = {
        "At 50% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 0.5 -> 0.6"
    }

    on = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.6

    off = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.5

    CFCDynamicLimits.Action "Slower-Adv2-Spawn-Rate", on, off, threshold, description, thresholdType

do
    threshold = 100
    thresholdType = "percentage"

    description = {
        "At 100% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 0.6 -> 0.75"
    }

    on = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.75

    off = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.6

    CFCDynamicLimits.Action "Slower-Adv2-Spawn-Rate2", on, off, threshold, description, thresholdType
