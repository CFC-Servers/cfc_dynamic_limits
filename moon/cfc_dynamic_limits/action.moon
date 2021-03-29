AddCSLuaFile!

export CFCDynamicLimits
CFCDynamicLimits.Actions = {}

class CFCDynamicLimits.Action
    new: (@name, @on, @off, @threshold, @description, @thresholdType="number") =>
        if @threshold <= 0
            CFCDynamicLimits.Logger\error "Threshold must be greater than zero"

        if @thresholdType == "percentage"
            @threshold = Round (@threshold / 100) * game.MaxPlayers!

        CFCDynamicLimits.Actions[@name] = self

    alert: (msg) =>
        msg = "[Dynamic Limits] #{msg}"
        for ply in *player.GetAll!
            ply\ChatPrint msg

    enable: () =>
        @alert "#{name} has been enabled"
        @on!

    disable: () =>
        @alert "#{name} has been disabled"
        @off!
