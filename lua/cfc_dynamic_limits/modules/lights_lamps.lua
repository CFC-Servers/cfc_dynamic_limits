local rawget
rawget = _G.rawget
local threshold = 75
local thresholdType = "percentage"
local hookName = "CFCDynamicLimits_LowerLightsLamps"
local description = {
  "At 75% server capacity, lights and lamp are disabled"
}
local isInEffect = false
local trackedEnts = {
  gmod_light = true,
  gmod_lamp = true,
  gmod_wire_light = true,
  gmod_wire_lamp = true
}
local wrapSetOn
wrapSetOn = function(ent)
  do
    local _with_0 = ent
    _with_0.DynamicLimits_OldSetOn = _with_0.SetOn
    _with_0.SetOn = function(self, on)
      if isInEffect and on then
        return 
      end
      return self:DynamicLimits_OldSetOn(on)
    end
    return _with_0
  end
end
local wrapWireLight
wrapWireLight = function(light)
  do
    local _with_0 = light
    _with_0.DynamicLimits_OldSetR = _with_0.SetR
    _with_0.DynamicLimits_OldSetG = _with_0.SetG
    _with_0.DynamicLimits_OldSetB = _with_0.SetB
    _with_0.SetR = function(self, r)
      if isInEffect and r > 0 then
        return 
      end
      return self:DynamicLimits_OldSetR(r)
    end
    _with_0.SetG = function(self, g)
      if isInEffect and g > 0 then
        return 
      end
      return self:DynamicLimits_OldSetG(g)
    end
    _with_0.SetB = function(self, b)
      if isInEffect and b > 0 then
        return 
      end
      return self:DynamicLimits_OldSetB(b)
    end
    return _with_0
  end
end
hook.Add("OnEntityCreated", "DynamicLimits_WrapLightsLamps", function(ent)
  if not (trackedEnts[ent:GetClass()]) then
    return 
  end
  if ent.SetOn then
    wrapSetOn(ent)
  else
    if ent.SetR then
      wrapWireLight(ent)
    end
  end
  return nil
end)
local on
on = function()
  isInEffect = true
  local allEnts = ents.GetAll()
  local entsCount = #allEnts
  for i = 1, entsCount do
    do
      local ent = rawget(allEnts, i)
      local entClass = ent:GetClass()
      local _exp_0 = entClass
      if "gmod_light" == _exp_0 then
        ent:SetOn(false)
      elseif "gmod_lamp" == _exp_0 then
        ent:SetOn(false)
      elseif "gmod_wire_lamp" == _exp_0 then
        ent:SetOn(false)
      elseif "gmod_wire_light" == _exp_0 then
        ent:SetR(0)
        ent:SetG(0)
        ent:SetB(0)
      end
    end
  end
end
local off
off = function()
  isInEffect = false
end
return CFCDynamicLimits.Action("Disable-Lights-Lamps", on, off, threshold, description, thresholdType)
