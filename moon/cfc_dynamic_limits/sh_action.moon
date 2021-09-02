AddCSLuaFile!
import Round from math
import insert from table

export CFCDynamicLimits
CFCDynamicLimits.Actions = {}

class CFCDynamicLimits.Action
    _parseThreshold = (threshold) -> Round (threshold / 100) * game.MaxPlayers!

    new: (@name, @on, @off, @threshold, @description, @thresholdType="number") =>
        if @threshold <= 0
            CFCDynamicLimits.Logger\error "Threshold must be greater than zero"

        if @thresholdType == "percentage"
            @threshold = _parseThreshold @threshold

        insert CFCDynamicLimits.Actions, self

    alert: (msg) =>
        msg = "[Dynamic Limits] #{msg}"
        for ply in *player.GetAll!
            ply\ChatPrint msg

    enable: () =>
        @alert "#{@name} has been enabled"
        @on!

    disable: () =>
        @alert "#{@name} has been disabled"
        @off!
