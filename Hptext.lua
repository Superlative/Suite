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

-- Set "Current - %" to Nameplates
local fixvalue = function(val)
    if(val >= 1e6) then
        return ('%.2f'..SECOND_NUMBER_CAP):format(val / 1e6):gsub('%.?0+(['..FIRST_NUMBER_CAP..SECOND_NUMBER_CAP..'])$', '%1')
    elseif(val >= 1e4) then
        return ('%.1f'..FIRST_NUMBER_CAP):format(val / 1e3):gsub('%.?0+(['..FIRST_NUMBER_CAP..SECOND_NUMBER_CAP..'])$', '%1')
    else
        return val
    end
end

CreateFrame('frame'):SetScript('OnUpdate', function(self, elapsed)
     for index = 1, select('#', WorldFrame:GetChildren()) do
          local f = select(index, WorldFrame:GetChildren())
          if f:GetName() and f:GetName():find('NamePlate%d') then
               f.h = select(1, select(1, f:GetChildren()):GetChildren())
               if f.h then
                    if not f.h.v then
                         f.h.v = f.h:CreateFontString(nil, "ARTWORK")    
                         f.h.v:SetPoint("CENTER", f.h, 'CENTER')
                         f.h.v:SetFont(STANDARD_TEXT_FONT, 9, 'OUTLINE')
                    else
                         local _, maxh = f.h:GetMinMaxValues()
                         local val = f.h:GetValue()
                         f.h.v:SetText(string.format("%s - %d%%", fixvalue(val), math.floor((val/maxh)*100)))
                    end
               end
          end
     end
end)