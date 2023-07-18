do
    local threshold = 75
    local thresholdType = "percentage"
    local description = {
        "At 75% server capacity, the following values are changed:",
        "  wire_holograms_max: 500 -> 200",
        "  wire_holograms_spawn_amount: 100 -> 50",
        "  wire_holograms_burst_amount: 250 -> 50"
    }

    local function on()
        RunConsoleCommand( "wire_holograms_max", 200 )
        RunConsoleCommand( "wire_holograms_spawn_amount", 50 )
        RunConsoleCommand( "wire_holograms_burst_amount", 50 )
    end

    local function off()
        RunConsoleCommand( "wire_holograms_max", 500 )
        RunConsoleCommand( "wire_holograms_spawn_amount", 100 )
        RunConsoleCommand( "wire_holograms_burst_amount", 250 )
    end

    CFCDynamicLimits.Action( "Lower Holo Limits 75%", on, off, threshold, description, thresholdType )
end

do
    local threshold = 100
    local thresholdType = "percentage"
    local description = {
        "At 100% server capacity, the following values are changed:",
        "  wire_holograms_spawn_amount: 50 -> 25",
        "  wire_holograms_burst_amount: 50 -> 30"
    }

    local function on()
        RunConsoleCommand( "wire_holograms_spawn_amount", 25 )
        RunConsoleCommand( "wire_holograms_burst_amount", 30 )
    end

    local function off()
        RunConsoleCommand( "wire_holograms_spawn_amount", 50 )
        RunConsoleCommand( "wire_holograms_burst_amount", 50 )
    end

    CFCDynamicLimits.Action( "Lower Holo Limits 100%", on, off, threshold, description, thresholdType )
end
