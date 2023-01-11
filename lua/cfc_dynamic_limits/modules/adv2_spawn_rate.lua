do
  local threshold = 40
  local thresholdType = "percentage"
  local description = {
    "At 40% server capacity, the following values are changed:",
    "  AdvDupe2_SpawnRate: 1 -> 0.5"
  }
  local on
  on = function()
    return RunConsoleCommand("AdvDupe2_SpawnRate", 0.5)
  end
  local off
  off = function()
    return RunConsoleCommand("AdvDupe2_SpawnRate", 1)
  end
  CFCDynamicLimits.Action("Slower-Adv2-Spawn-Rate", on, off, threshold, description, thresholdType)
end
do
  local threshold = 70
  local thresholdType = "percentage"
  local description = {
    "At 70% server capacity, the following values are changed:",
    "  AdvDupe2_SpawnRate: 0.5 -> 0.35"
  }
  local on
  on = function()
    return RunConsoleCommand("AdvDupe2_SpawnRate", 0.35)
  end
  local off
  off = function()
    return RunConsoleCommand("AdvDupe2_SpawnRate", 0.5)
  end
  return CFCDynamicLimits.Action("Slower-Adv2-Spawn-Rate2", on, off, threshold, description, thresholdType)
end
