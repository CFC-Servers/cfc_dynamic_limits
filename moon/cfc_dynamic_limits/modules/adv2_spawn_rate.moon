do
    threshold = 40
    thresholdType = "percentage"

    description = {
        "At 40% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 1 -> 0.5"
    }

    on = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.5

    off = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 1

    CFCDynamicLimits.Action "Slower-Adv2-Spawn-Rate", on, off, threshold, description, thresholdType

do
    threshold = 60
    thresholdType = "percentage"

    description = {
        "At 60% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 0.5 -> 0.35"
    }

    on = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.35

    off = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.5

    CFCDynamicLimits.Action "Slower-Adv2-Spawn-Rate2", on, off, threshold, description, thresholdType

do
    threshold = 80
    thresholdType = "percentage"

    description = {
        "At 80% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 0.35 -> 0.2"
    }

    on = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.2

    off = () ->
        RunConsoleCommand "AdvDupe2_SpawnRate", 0.35

    CFCDynamicLimits.Action "Slower-Adv2-Spawn-Rate3", on, off, threshold, description, thresholdType
