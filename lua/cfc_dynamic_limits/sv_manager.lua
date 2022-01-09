local pairs
pairs = _G.pairs
local CFCDynamicLimitsManager
do
  local _class_0
  local _base_0 = {
    onPlayerJoin = function()
      local newCount = player.GetCount()
      for name, action in pairs(CFCDynamicLimits.Actions) do
        if newCount == action.threshold then
          action:enable()
        end
      end
    end,
    onPlayerLeave = function()
      local newCount = player.GetCount()
      for name, action in pairs(CFCDynamicLimits.Actions) do
        if newCount == action.threshold - 1 then
          action:disable()
        end
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "CFCDynamicLimitsManager"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  CFCDynamicLimitsManager = _class_0
end
hook.Add("PlayerInitialSpawn", "CFCDynamicLimits_PlayerJoin", function()
  CFCDynamicLimits.Manager.onPlayerJoin()
  return nil
end)
hook.Add("PlayerDisconnected", "CFCDynamicLimits_PlayerDisconnected", function()
  CFCDynamicLimits.Manager.onPlayerLeave()
  return nil
end)
CFCDynamicLimits.Manager = CFCDynamicLimitsManager()
