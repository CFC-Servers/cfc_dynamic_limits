AddCSLuaFile!

export CFCDynamicLimits
CFCDynamicLimits.Actions = {}

class CFCDynamicLimits.Action
    new: (@name, @on, @off, @threshold) =>
        if @thresholdType <= 0
            CFCDynamicLimits.Logger\error "Threshold must be greater than zero"

        -- Treat < 1 as a percentage
        if @thresholdType < 1
            @threshold = Round @threshold * game.MaxPlayers!

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

