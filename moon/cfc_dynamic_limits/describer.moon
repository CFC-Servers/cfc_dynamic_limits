AddCSLuaFile!

return unless CLIENT

net.Receive "CFCDynamicLimits_DescribeAction", () ->
    -- Do some fancy printing here maybe
