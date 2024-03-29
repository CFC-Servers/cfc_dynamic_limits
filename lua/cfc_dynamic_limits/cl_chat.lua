local prefixColor = Color( 41, 41, 41 )
local textColor = Color( 180, 180, 180 )
local enableColor = Color( 0, 255, 0 )
local disableColor = Color( 255, 0, 0 )
local prefix = "• Dynamic Limits "

net.Receive( "cfc_dynamiclimits_notify", function()
    local moduleName = net.ReadString()

    local mod = CFCDynamicLimits.Modules[moduleName]
    if not mod then return end

    local enable = net.ReadBool()
    mod.enabled = enable

    local printEnable = enable
    if mod.invertedPrint then
        printEnable = not enable
    end

    if printEnable then
        chat.AddText( prefixColor, prefix, enableColor, moduleName, textColor, " has been enabled." )
    else
        chat.AddText( prefixColor, prefix, disableColor, moduleName, textColor, " has been disabled." )
    end
end )


hook.Add( "OnPlayerChat", "CFC_DynamicLimits_ChatCommand", function( ply, text )
    local txt = string.lower( text )
    if txt ~= "!dynlimits" then return end
    if ply ~= LocalPlayer() then return true end

    local menu = vgui.Create( "DFrame" )
    menu:SetSize( 400, 630 )
    menu:Center()
    menu:SetTitle( "Dynamic Limits" )
    menu:MakePopup()

    -- List all modules under eachother, not using DListView as its ugly, we use DScrollPanel
    local scroll = vgui.Create( "DScrollPanel", menu )
    scroll:Dock( FILL )

    local list = vgui.Create( "DListLayout", scroll )
    list:Dock( FILL )

    for moduleName, mod in pairs( CFCDynamicLimits.Modules ) do
        local descriptionText = ""
        local lineCount = 0
        for _, action in pairs( mod.description ) do
            lineCount = lineCount + 1
            descriptionText = descriptionText .. action .. "\n"
        end
        descriptionText = string.Trim( descriptionText, "\n" )

        local panel = vgui.Create( "DPanel", list )
        panel:SetTall( lineCount * 10 + 50 )
        panel:Dock( TOP )
        panel:DockMargin( 0, 0, 0, 5 )
        panel:DockPadding( 5, 10, 5, 5 )

        local requirement = vgui.Create( "DLabel", panel )
        requirement:SetWide( 70 )
        requirement:SetText( GetGlobal2Int( "CFC_DynamicLimits_PlayersCounted", player.GetCount() ) .. "/" .. mod.threshold .. " players" )
        requirement:SetFont( "DermaDefault" )
        requirement:SetTextColor( prefixColor )
        requirement:Dock( RIGHT )

        local label = vgui.Create( "DLabel", panel )
        label:SetText( moduleName )
        label:SetFont( "ScoreboardDefault" )
        label:SetTextColor( mod.enabled and Color( 0, 255, 0 ) or Color( 255, 0, 0 ) )
        label:Dock( TOP )

        local description = vgui.Create( "DLabel", panel )
        description:SetText( descriptionText )
        description:SetFont( "DermaDefault" )
        description:SetTextColor( prefixColor )
        description:Dock( FILL )
    end

    return true
end )
