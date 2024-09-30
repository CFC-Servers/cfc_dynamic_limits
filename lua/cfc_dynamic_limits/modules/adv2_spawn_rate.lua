do
    local threshold = 20 -- 20% of 64 is 12
    local thresholdType = "percentage"
    local description = {
        "At 20% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 1 -> 0.5"
    }

    local function on()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 0.5 )
    end

    local function off()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 1 )
    end

    CFCDynamicLimits.Action( "Slower Adv2 Spawn Rate 10%", on, off, threshold, description, thresholdType )
end

do
    local threshold = 50
    local thresholdType = "percentage"
    local description = {
        "At 50% server capacity, the following values are changed:",
        "  AdvDupe2_SpawnRate: 0.5 -> 0.35"
    }

    local function on()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 0.35 )
    end

    local function off()
        RunConsoleCommand( "AdvDupe2_SpawnRate", 0.5 )
    end

    CFCDynamicLimits.Action( "Slower Adv2 Spawn Rate 50%", on, off, threshold, description, thresholdType )
end
