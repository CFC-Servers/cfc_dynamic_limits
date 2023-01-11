local Split, StartWith, lower
do
  local _obj_0 = string
  Split, StartWith, lower = _obj_0.Split, _obj_0.StartWith, _obj_0.lower
end
local Actions
Actions = CFCDynamicLimits.Actions
local RED = Color(230, 75, 75)
local YELLOW = Color(230, 230, 75)
local GREEN = Color(75, 230, 75)
local actionDescriptions
do
  local _tbl_0 = { }
  for _index_0 = 1, #Actions do
    local a = Actions[_index_0]
    _tbl_0[a.name] = a.description
  end
  actionDescriptions = _tbl_0
end
local describeAction
describeAction = function(name)
  MsgC(GREEN, tostring(name) .. ":\n")
  local description = actionDescriptions[name]
  if not description then
    MsgC(RED, "No Action found with that name\n")
    return 
  end
  MsgC("\n")
  for _index_0 = 1, #description do
    local line = description[_index_0]
    MsgC(YELLOW, line, "\n")
  end
  return MsgC("\n")
end
return hook.Add("OnPlayerChat", "CFCDynamicLimits_DescribeAction", function(ply, text)
  if not (StartWith(text, "!dynlimits")) then
    return 
  end
  local actionName = Split(text, " ")[2]
  chat.AddText(GREEN, "[Dynamic Limits] Details printed to your console!")
  if not actionName then
    for name, description in pairs(actionDescriptions) do
      describeAction(name)
    end
  else
    describeAction(lower(actionName))
  end
  return true
end)
