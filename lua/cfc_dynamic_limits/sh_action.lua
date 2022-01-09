AddCSLuaFile()
local Round
Round = math.Round
local insert
insert = table.insert
CFCDynamicLimits.Actions = { }
do
  local _class_0
  local _parseThreshold
  local _base_0 = {
    alert = function(self, msg)
      msg = "[Dynamic Limits] " .. tostring(msg)
      local _list_0 = player.GetAll()
      for _index_0 = 1, #_list_0 do
        local ply = _list_0[_index_0]
        ply:ChatPrint(msg)
      end
    end,
    enable = function(self)
      self:alert(tostring(self.name) .. " has been enabled")
      return self:on()
    end,
    disable = function(self)
      self:alert(tostring(self.name) .. " has been disabled")
      return self:off()
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, name, on, off, threshold, description, thresholdType)
      if thresholdType == nil then
        thresholdType = "number"
      end
      self.name, self.on, self.off, self.threshold, self.description, self.thresholdType = name, on, off, threshold, description, thresholdType
      if self.threshold <= 0 then
        CFCDynamicLimits.Logger:error("Threshold must be greater than zero")
      end
      if self.thresholdType == "percentage" then
        self.threshold = _parseThreshold(self.threshold)
      end
      return insert(CFCDynamicLimits.Actions, self)
    end,
    __base = _base_0,
    __name = "Action"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  _parseThreshold = function(threshold)
    return Round((threshold / 100) * game.MaxPlayers())
  end
  CFCDynamicLimits.Action = _class_0
  return _class_0
end
