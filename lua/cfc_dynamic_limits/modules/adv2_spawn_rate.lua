do
    local threshold = 40
    local thresholdType = "percentage"

    local description = {
        "At 40% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 1 -> 0.5",
    }

    local on = function()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 0.5 )
    end

    local off = function()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 1 )
    end

    CFCDynamicLimits.Action( "Slower-Adv2-SpawnRate", on, off, threshold, description, thresholdType )
end

do
    local threshold = 60
    local thresholdType = "percentage"

    local description = {
        "At 60% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 0.5 -> 0.35",
    }

    local on = function()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 0.35 )
    end

    local off = function()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 0.5 )
    end

    CFCDynamicLimits.Action( "Slower-Adv2-SpawnRate2", on, off, threshold, description, thresholdType )
end

do
    local threshold = 80
    local thresholdType = "percentage"

    local description = {
        "At 80% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 0.35 -> 0.1",
    }

    local on = function()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 0.1 )
    end

    local off = function()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 0.35 )
    end

    CFCDynamicLimits.Action( "Slower-Adv2-SpawnRate3", on, off, threshold, description, thresholdType )
end
