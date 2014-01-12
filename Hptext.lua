-- Set Mana/hp values to Current (only)

hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", function()
        --PlayerFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("player")))
        PlayerFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("player")))

        --TargetFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("target")))
        TargetFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("target")))

        --FocusFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("focus")))
        FocusFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("focus")))
end)

-- Sets Hp to "Current  -  % )
FrameList = {"Player", "Target", "Focus"}
function UpdateHealthValues(...)
for i = 1, select("#", unpack(FrameList)) do
local FrameName = (select(i, unpack(FrameList)))
if UnitHealth(FrameName) < 1000 then
         local Health = UnitHealth(FrameName)
else
         local Health = (UnitHealth(FrameName))/1000
         local HealthPercent = (UnitHealth(FrameName)/UnitHealthMax(FrameName))*100
        
         if UnitHealth(FrameName) < 1000 then
         _G[FrameName.."FrameHealthBar"].TextString:SetText(Health.." ("..format("%.0f",HealthPercent).."%)")
         else
         _G[FrameName.."FrameHealthBar"].TextString:SetText(format("%.0f",Health).."k  -  "..format("%.0f",HealthPercent).."%")
        
         end
end
end
end
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", UpdateHealthValues)